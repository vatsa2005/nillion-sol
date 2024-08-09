from web3 import Web3
import requests

def relay_eth_to_btc(eth_tx):
    btc_node_url = 'http://bitcoin-node-url'
    btc_address = eth_tx['btc_address']
    amount = eth_tx['amount']

    response = requests.post(btc_node_url, json={'btc_address': btc_address, 'amount': amount})
    return response.json()
