import binascii
import jwt
import time

secret=binascii.unhexlify(open("secret","r").read().strip())

token=open("validjwt").read().strip()
jwt.decode(token, key=secret)

data = jwt.decode(token, key=secret)

print("decoded", data)

data['lastName']="myself"
data['emailAddress']="v@odahub.io"

print(data['exp'])
data['exp']=int(time.time()+10)
print(data['exp'])

cjwt=jwt.encode(data, key=secret)
open("custom-jwt","wb").write(cjwt)

import requests

while True: 
    r=requests.get("http://localhost:8000/secure/", cookies=dict(rampartjwt=cjwt.decode()))

    print(r.status_code)
    print(r.content)
    print(r.headers)
    time.sleep(1)
