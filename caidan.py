import time
import os
time.sleep(5)
def sb():
    while 1:
        with open('server.log','r') as fp:
            lines = fp.readlines()
            last_line = lines[-1].strip()
            if "NicheID:" in last_line:
                new = last_line.split("NicheID:")[1].strip()
                os.system("curl -i -H \"Accept:application/json\" -X POST -d \'{\"UserId\"7,\"GameId\":26,\"NicheId\":\""+new+"\"}\' http://101.43.14.68:8888/niche/put")

sb()
