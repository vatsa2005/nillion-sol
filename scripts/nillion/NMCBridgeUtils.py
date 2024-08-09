from nillion import NillionClient
import secrets

def encrypt_key(secret_key, condition):
    # Perform encryption (simple example, use proper encryption in production)
    encrypted_key = secret_key + condition
    return encrypted_key

def generate_masked_particles(encrypted_key, n):
    particles = []
    blinding_factors = []
    for i in range(n):
        blinding_factor = secrets.token_bytes(len(encrypted_key))
        particle = bytes(a ^ b for a, b in zip(encrypted_key.encode(), blinding_factor))
        particles.append(particle)
        blinding_factors.append(blinding_factor)
    return particles, blinding_factors

def linear_secret_sharing(blinding_factors, t):
    shares = []
    for factor in blinding_factors:
        polynomial = [factor] + [secrets.token_bytes(len(factor)) for _ in range(t)]
        factor_shares = [sum(polynomial[j] * (x ** j) for j in range(t + 1)) for x in range(1, len(blinding_factors) + 1)]
        shares.append(factor_shares)
    return shares

def distribute_particles_and_shares(particles, shares, nodes):
    for i, node in enumerate(nodes):
        # Assuming node has a method to receive particles and shares
        node.receive_particle(particles[i])
        node.receive_shares([share[i] for share in shares])

def validate_condition(condition_met):
    # This function should validate the condition on the Ethereum blockchain
    return condition_met

def reconstruct_key(particles, shares, t):
    reconstructed_factors = [sum(share[i] for share in shares) for i in range(t + 1)]
    reconstructed_key = bytes(a ^ b for a, b in zip(particles[0], reconstructed_factors[0]))
    return reconstructed_key
