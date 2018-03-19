from converter import *

setup_workbook(
  path=r'C:\Users\pj6526bw\Documents\car-rental\database\fake data\full test data.xls',
  sht_list=['booking', 'booking_line', 'car', 'car_make', 'car_spec', 'car_state', 'car_type', 'card', 'card_payment', 'customer', 'customer_type', 'office', 'rental_price']
)

cars = cars(
  path='cars.csv',
  columns={'CarMake': 0, 'CarType': 1, 'Model': 2, 'Prod_Year': 3, 'Image_URL': 4, 'Seats': 5, 'Cruise_Control': 6, 'Air_Conditioning': 7, 'Parking_Sensor': 8, 'Heated_Seats': 9, 'Audio_Input': 10, 'Bluetooth': 11, 'Sunroof': 12, 'Price_Bought': 13}
)
cars_make = cars.get_carmake().to_dict('index')
cars_type = cars.get_cartype().to_dict('index')
cars_spec = cars.get_carspec(
  cars_make=cars_make,
  cars_type=cars_type,
  col_names=['Model', 'Prod_Year', 'Image_URL', 'Seats', 'Cruise_Control', 'Air_Conditioning', 'Parking_Sensor', 'Heated_Seats', 'Audio_Input', 'Bluetooth', 'Sunroof', 'Price_Bought']
)
cars_state = cars.get_carstate(states=['Excellent', 'Good', 'Average'])

cust = customer()
print(cust.get_customer())
