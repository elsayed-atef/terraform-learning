import os
import shutil
import glob
import re
import multiprocessing as mp

def parallel_copy_and_search(servers, src_dir, dst_dir, patterns):
    
    # Define worker function inside parallel_copy_and_search to avoid pickling issues on Windows
    def worker(server):
        # Get the list of log files in the source directory on the remote server
        files = glob.glob(f"\\\\{server}\\{src_dir}\\*.log*")
        
        # Sort the files by modification time and get the latest .log and .log.gz files
        files.sort(key=lambda x: os.path.getmtime(x))
        log_file = None
        gz_file = None
        for file in files[::-1]:
            if file.endswith('.log'):
                log_file = file
                break
            elif file.endswith('.log.gz'):
                gz_file = file
                break
                
        # Copy the latest log files to the destination directory on the local machine
        if log_file:
            shutil.copy2(log_file, os.path.join(dst_dir, f"{server}_latest.log"))
        if gz_file:
            shutil.copy2(gz_file, os.path.join(dst_dir, f"{server}_latest.log.gz"))
        
        # Search for the specified patterns in the log files
        for file in [log_file, gz_file]:
            if file:
                with open(file, 'r') as f:
                    contents = f.read()
                    for pattern in patterns:
                        if re.search(pattern, contents):
                            print(f"Found pattern '{pattern}' in file '{file}' on server '{server}'")
    
    # Create a process pool and map the worker function to each server in parallel
    with mp.Pool() as pool:
        pool.map(worker, servers)
