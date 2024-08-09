import requests

def get_btc_price():
    response = requests.get('https://api.coindesk.com/v1/bpi/currentprice/BTC.json')
    data = response.json()
    return data['bpi']['USD']['rate']
