import concurrent.futures
import requests
import time

# Replace 'your_url_here' with the actual URL you want to request
url = 'http://asg-demo-lb-1941584146.us-east-1.elb.amazonaws.com/'

def make_request(url):
    try:
        response = requests.get(url)
        # You can add additional processing for the response if needed
        print(f"Request to {url} successful. Status code: {response.status_code}")
    except Exception as e:
        print(f"Request to {url} failed. Error: {e}")

def run_concurrently(url, num_requests, duration):
    start_time = time.time()

    with concurrent.futures.ThreadPoolExecutor() as executor:
        futures = [executor.submit(make_request, url) for _ in range(num_requests)]

        # Wait for all futures to complete or until the specified duration
        concurrent.futures.wait(futures, timeout=duration)

    end_time = time.time()
    elapsed_time = end_time - start_time
    print(f"Total elapsed time: {elapsed_time:.2f} seconds")

if __name__ == "__main__":
    num_requests_per_thread = 300
    duration_in_minutes = 100
    total_requests = num_requests_per_thread * duration_in_minutes

    print(f"Running {num_requests_per_thread} requests concurrently for {duration_in_minutes} minutes.")
    run_concurrently(url, total_requests, duration_in_minutes * 60)
