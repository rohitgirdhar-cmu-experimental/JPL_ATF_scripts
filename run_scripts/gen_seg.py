import zmq
import os
import subprocess

datadir = '/memexdata/Dataset/processed/0007_JPL_ATF/'
lstfpath = os.path.join(datadir, 'Images/lists/Images.txt')
imgsdir = os.path.join(datadir, 'Images/corpus/')
segoutdir = '/srv2/rgirdhar/Work/Code/0005_ObjSegment/scripts/seg_service_scripts_2/temp-dir/'
finaloutdir = os.path.join(datadir, 'Features/Segments')

context = zmq.Context()
socket = context.socket(zmq.REQ)
socket.connect("tcp://localhost:5559")

with open(lstfpath) as f:
  lst = f.read().splitlines()

i = 1
for el in lst:
  socket.send(os.path.join(imgsdir, el) + "\0")
  message = socket.recv()
  subprocess.call('cp ' + segoutdir + '/result.jpg ' + finaloutdir + '/' + str(i) + '.jpg', shell=True)
  i += 1
