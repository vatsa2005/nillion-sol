from nillion import NillionClient

def store_data(data):
    client = NillionClient(api_key='your-nillion-api-key')
    storage_id = client.store(data)
    return storage_id

def retrieve_data(storage_id):
    client = NillionClient(api_key='your-nillion-api-key')
    data = client.retrieve(storage_id)
    return data

if __name__ == "__main__":
    data = "Sample data to store"
    storage_id = store_data(data)
    print(f"Storage ID: {storage_id}")
    retrieved_data = retrieve_data(storage_id)
    print(f"Retrieved Data: {retrieved_data}")
