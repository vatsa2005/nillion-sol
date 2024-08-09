from nillion import NillionClient

def perform_mpc(operation, data):
    client = NillionClient(api_key='your-nillion-api-key')
    computation_id = client.request_computation(operation, data)
    return computation_id

def get_computation_result(computation_id):
    client = NillionClient(api_key='your-nillion-api-key')
    result = client.get_result(computation_id)
    return result

if __name__ == "__main__":
    operation = "add"
    data = "1+1"
    computation_id = perform_mpc(operation, data)
    print(f"Computation ID: {computation_id}")
    result = get_computation_result(computation_id)
    print(f"Computation Result: {result}")
