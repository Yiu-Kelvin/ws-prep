import base64
import os
import requests
import time
from concurrent.futures import ThreadPoolExecutor, as_completed

def generate_random_base64(length: int = 48) -> str:
    """Generate a random Base64 string without padding (to match URL-safe format)"""
    random_bytes = os.urandom(length)
    return base64.b64encode(random_bytes).decode('utf-8').rstrip('=')

def test_load(url: str, input_value: str, timeout: float = 5.0) -> tuple:
    """Send a single request and return status code and response time"""
    try:
        start = time.time()
        response = requests.get(url, params={'input': input_value}, timeout=timeout)
        return response.status_code, time.time() - start
    except Exception as e:
        return None, None

def main():
    target_url = "http://127.0.0.1/calc"
    num_requests = 200
    concurrency = 20
    success_count = 0
    total_time = 0.0
    response_times = []

    print(f"Starting load test: {num_requests} requests with {concurrency} concurrency")
    start_all = time.time()

    with ThreadPoolExecutor(max_workers=concurrency) as executor:
        futures = {
            executor.submit(test_load, target_url, generate_random_base64())
            for _ in range(num_requests)
        }

        for future in as_completed(futures):
            status, elapsed = future.result()
            if elapsed is not None:
                success_count += 1
                total_time += elapsed
                response_times.append(elapsed)
                print(f"Ran {success_count}/{num_requests} | Status: {status} | Time: {elapsed:.4f}s")

    total_duration = time.time() - start_all
    print(f"\nTest completed in {total_duration:.2f}s")
    print(f"Success rate: {success_count/num_requests:.1%} ({success_count}/{num_requests})")
    if success_count:
        print(f"Average response time: {sum(response_times)/success_count:.4f}s")
        print(f"Throughput: {success_count/total_duration:.2f} req/s")

if __name__ == "__main__":
    main()
