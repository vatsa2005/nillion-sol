from bitcoinlib.wallets import Wallet

def lock_btc(btc_address, amount):
    wallet = Wallet.create('LockingWallet')
    tx = wallet.send_to(btc_address, amount, fee='standard')
    return tx

if __name__ == "__main__":
    btc_address = "your_btc_address"
    amount = 0.01  # BTC amount
    tx = lock_btc(btc_address, amount)
    print(f"Transaction ID: {tx.txid}")
