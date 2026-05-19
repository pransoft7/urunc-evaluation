import hashlib
data = b"x" * 1024
for i in range(100000):
    hashlib.sha256(data).hexdigest()
print("done")
