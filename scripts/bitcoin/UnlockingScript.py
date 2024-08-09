from bitcoinlib.wallets import Wallet

def unlock_btc(btc_address, amount):
    wallet = Wallet.create('UnlockingWallet')
    tx = wallet.send_to(btc_address, amount, fee='standard')
    return tx

if __name__ == "__main__":
    btc_address = "your_btc_address"
    amount = 0.01  # BTC amount
    tx = unlock_btc(btc_address, amount)
    print(f"Transaction ID: {tx.txid}")
