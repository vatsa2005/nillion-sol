from web3 import Web3
import requests

def relay_btc_to_eth(btc_tx):
    eth_node_url = 'http://ethereum-node-url'
    web3 = Web3(Web3.HTTPProvider(eth_node_url))

    eth_contract_address = '0xYourContractAddress'
    contract_abi = 'YourContractABI'

    contract = web3.eth.contract(address=eth_contract_address, abi=contract_abi)
    tx = contract.functions.lock(btc_tx['btc_address'], btc_tx['amount']).transact({'from': web3.eth.accounts[0]})

    return tx
