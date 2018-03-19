import xlwings as xw
import pandas as pd
from lxml import html
import requests
from random import choice, random
import string

def setup_workbook(path, sht_list):
  wb = xw.Book(path)

  # add new sheets if any
  for sht in wb.sheets:
    if sht.name in sht_list:
      sht_list.remove(sht.name)

  for sht in sht_list:
    wb.sheets.add(sht)

class cars(object):
  def __init__(self, path, columns):
    self.cars_data = pd.read_csv(path)
    self.cars_columns = columns

  def get_carmake(self):
    cars_make = sorted(set(self.cars_data.iloc[:, self.cars_columns['CarMake']]))
    cars_make_df = pd.DataFrame([x for x in range(len(cars_make))], index=cars_make,columns=['CarMake_ID'])
    cars_make_df.index.name = 'CarMake'
    return cars_make_df

  def get_cartype(self):
    cars_type = sorted(set(self.cars_data.iloc[:, self.cars_columns['CarType']]))
    cars_type_df = pd.DataFrame([x for x in range(len(cars_type))], index=cars_type, columns=['CarType_ID'])
    cars_type_df.index.name = 'CarType'
    return cars_type_df

  def get_carspec(self, cars_make, cars_type, col_names=['Model', 'Prod_Year', 'Image_URL', 'Seats', 'Cruise_Control', 'Air_Conditioning', 'Parking_Sensor', 'Heated_Seats', 'Audio_Input', 'Bluetooth', 'Sunroof', 'Price_Bought']):
    cars_spec_df = pd.DataFrame(self.cars_data, index=[x for x in range(len(self.cars_data))], columns=['CarMake_ID', 'CarType_ID']+col_names)
    cars_spec_df.index.name = 'Spec_ID'
    cars_spec_df['CarMake_ID'] = [cars_make[self.cars_data.iloc[x, 0]]['CarMake_ID'] for x in range(len(self.cars_data))]
    cars_spec_df['CarType_ID'] = [cars_type[self.cars_data.iloc[x, 1]]['CarType_ID'] for x in range(len(self.cars_data))]
    return cars_spec_df

  def get_carstate(self, states=['Excellent', 'Good', 'Average']):
    cars_state = states
    cars_state_df = pd.DataFrame([x for x in range(len(cars_state))], index=cars_state, columns=['CarState_ID'])
    cars_state_df.index.name = 'State'
    return cars_state_df

class customer(object):
  def __init__(self):
    page = requests.get('https://www.fakeaddressgenerator.com/World_Address/get_us_address')
    self.content = html.fromstring(page.content)

  def get_customer(self):
    customer_df = pd.DataFrame({
      'Cust_Name': [self.get_fullname()],
      'Cust_Phone': [self.get_phone()],
      'Cust_Email': [self.get_email()],
      'Cust_Gender': [self.get_gender()],
      'Cust_LicenseNum': [self.get_license_num()],
      'Cust_IssueLocation': [self.get_license_state()],
      'Cust_DOB': [self.get_dob()],
      'Cust_StrAdd': [self.get_stradd()],
      'Cust_City': [self.get_city()],
      'Cust_State': [self.get_state()],
      'Cust_Zip': [self.get_zip()],
      'Cust_Username': [self.get_username()],
      'Cust_Password': [self.get_password()],
      'CustType_ID': [self.assign_custtypeid()]
    })
    customer_df.index.name = 'Cust_ID'
    return customer_df

  def get_fullname(self):
    full_name = self.content.xpath('//*[text()="Full Name"]/parent::div/following-sibling::div[1]/strong/input/@value')
    return ''.join(full_name).replace(u'\xa0', u' ')

  def get_phone(self):
    phone = self.content.xpath('//*[text()="Phone Number"]/parent::div/following-sibling::div[1]/strong/input/@value')
    return ''.join(phone)

  def get_email(self):
    email = ''.join([choice(string.ascii_letters + string.digits + '_').lower() for x in range(15)])
    return email + '@gmail.com'

  def get_gender(self):
    gender = self.content.xpath('//*[text()="Gender"]/parent::div/following-sibling::div[1]/strong/input/@value')
    if gender == 'male':
      return 'M'
    return 'F'

  def get_license_num(self):
    license = self.content.xpath('//*[text()="Car License Plate"]/parent::div/following-sibling::div[1]/strong/input/@value')
    return ''.join(license).split(' ')[0]

  def get_license_state(self):
    if random() > 0.1:
      return 'US'
    return 'International'

  def get_dob(self):
    dob = self.content.xpath('//*[text()="Birthday"]/parent::div/following-sibling::div[1]/strong/input/@value')
    return ''.join(dob)

  def get_stradd(self):
    stradd = self.content.xpath('//*[text()="Street"]/parent::div/following-sibling::div[1]/strong/input/@value')
    return ''.join(stradd)

  def get_city(self):
    city = self.content.xpath('//*[text()="City"]/parent::div/following-sibling::div[1]/strong/input/@value')
    return ''.join(city)

  def get_state(self):
    state = self.content.xpath('//*[text()="State"]/parent::div/following-sibling::div[1]/strong/input/@value')
    return ''.join(state)

  def get_zip(self):
    zip = self.content.xpath('//*[text()="Zip Code"]/parent::div/following-sibling::div[1]/strong/input/@value')
    return ''.join(zip)

  def get_username(self):
    username = self.content.xpath('//*[text()="Username"]/parent::div/following-sibling::div[1]/strong/input/@value')
    return ''.join(username)

  def get_password(self):
    password = self.content.xpath('//*[text()="Password"]/parent::div/following-sibling::div[1]/strong/input/@value')
    return ''.join(password)

  def get_custtype(self, types=['VIP', 'Normal', 'With violations']):
    cust_type = types
    cust_type_df = pd.DataFrame([x for x in range(len(cust_type))], index=cust_type, columns=['CustType_ID'])
    cust_type_df.index.name = 'Type'
    cust_type_df['Multiplier'] = [0.9, 1, 1.1]
    return cust_type_df

  def assign_custtypeid(self):
    custtype_dict = self.get_custtype().to_dict('index')
    prob = random()
    if prob < 0.2:
      return custtype_dict['VIP']['CustType_ID']
    elif prob < 0.7:
      return custtype_dict['Normal']['CustType_ID']
    else:
      return custtype_dict['With violations']['CustType_ID']

class office(object):
  def __init__(self, path, columns):
    self.offices_data = pd.read_csv(path)
    self.offices_columns = columns
    
  def get_offices(self):
    offices = self.offices_data.iloc[:, :]
    offices_df = pd.DataFrame([x for x in range(len(offices))], index=offices,columns=self.offices_columns)
    offices_df.index.name = 'Office_ID'
    return offices_df