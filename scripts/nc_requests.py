from urllib import request
import requests
nextcloud_base_url = "http://127.0.0.1:8080/nextcloud"
login = "/index.php/login/"
sharing_api = "/ocs/v2.php/apps/files_sharing/api/v1"
s = requests.Session()
r = s.get(nextcloud_base_url)
print(r)
r = s.get(nextcloud_base_url + login)
print(r)
r = requests.post(nextcloud_base_url + login, data = {"user" :"alice", 
                                               "password":"password"})
print(r)                                               
print(r.headers)
print(r.content)

