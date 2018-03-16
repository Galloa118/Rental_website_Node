from lxml import html
import requests
import copy

def get_content(url, xpath):
  results = []
  page = requests.get(url)
  content = html.fromstring(page.content)
  for x in xpath:
    results.append(content.xpath(x))

  return results

def get_response_info(response, index):
  if len(responses[index]) != 0:
    return responses[index][0]
  return "NO"

counter = 0
outFile = open('cars.txt', 'w')

car = {'brand': '', 'model': '', 'type': '', 'year': '','image url': '', 'seats': '', 'cruise control': '', 'air conditioning': '', 'parking sensor': '', 'heated seats': '', 'audio input': '', 'bluetooth': '', 'sunroof': '', 'price': ''}
cars = []

base = 'http://www.cars-data.com/en/'
brands = get_content(base, ['//select[@name="mark"]/*/@value'])[0]

for brand in brands:
  if brand != "":
    car['brand'] = brand
    models = get_content('http://www.cars-data.com/ajax_files/get_groups.php?url=' + brand, ['//select[@name="groups"]/*/@value'])[0]

    for model in models:
      if model != "":
        car['model'] = model
        years_links = get_content('http://www.cars-data.com/ajax_files/get_years.php?url=' + model, ['//select[@name="years"]/*/@value'])[0]

        car['type'] = model[model.find('|')+1:]

        for yl in years_links:
          yr = yl[:yl.find('|')]
          if yl != "" and int(yr) > 2015:
            car['year'] = yr

            link = yl[yl.find('|')+1:]
            responses = get_content(base + link, ['//div[@class="img100"]/*/a/img/@src', '//div[@class="row"]/*/*/a/@href'])

            if len(responses[0]) != 0 and len(responses[1]) != 0:
              car['image url'] = responses[0][0]
              inner_link = responses[1][-1]
              responses = get_content(inner_link, [
                '//*[text()="Seating capacity:"]/following-sibling::div[1]/text()',
                '//*[text()="Cruise control:"]/following-sibling::div[1]/text()',
                '//*[text()="Air conditioning:"]/following-sibling::div[1]/text()',
                '//*[text()="Parking sensors:"]/following-sibling::div[1]/text()',
                '//*[text()="Heated seats:"]/following-sibling::div[1]/text()',
                '//*[text()="Audio input:"]/following-sibling::div[1]/text()',
                '//*[text()="Bluetooth:"]/following-sibling::div[1]/text()',
                '//*[text()="Sliding / tilt sunroof:"]/following-sibling::div[1]/text()',
                '//*[text()="Last new price:"]/following-sibling::div[1]/text()'
              ])

              car['seats'] = get_response_info(responses, 0)
              car['cruise control'] = get_response_info(responses, 1)
              car['air conditioning'] = get_response_info(responses, 2)
              car['parking sensor'] = get_response_info(responses, 3)
              car['heated seats'] = get_response_info(responses, 4)
              car['audio input'] = get_response_info(responses, 5)
              car['bluetooth'] = get_response_info(responses, 6)
              car['sunroof'] = get_response_info(responses, 7)
              car['price'] = get_response_info(responses, 8)

              tmp = copy.copy(car)
              cars.append(tmp)
              counter += 1
              outFile.write(str(car) + '\n')
              print(counter)
              print(car)
              print('-----------------------------------------------------------------------------------------')


print(cars)