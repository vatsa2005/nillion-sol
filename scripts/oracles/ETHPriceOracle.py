import requests

def get_eth_price():
    response = requests.get('https://api.coindesk.com/v1/bpi/currentprice/ETH.json')
    data = response.json()
    return data['bpi']['USD']['rate']
