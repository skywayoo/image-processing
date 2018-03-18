import numpy as np
import cv2
import matplotlib.pyplot as plt

im = cv2.imread('E:/JPEG.jpg')
imgray = cv2.cvtColor(im,cv2.COLOR_BGR2GRAY)
ret,thresh = cv2.threshold(imgray,127,255,0)
img,contours, hierarchy = cv2.findContours(thresh,cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)
print "there are " + str(len(contours)) + " contours"
cnt = contours[2]
print "there are " + str(len(cnt)) + " points in contours[0]"
approx = cv2.approxPolyDP(cnt,30,True)
print "after approx, there are " + str(len(approx)) + " points"
print approx
cv2.drawContours(im,[approx],0,(255,0,0),-1)
print 'hierarcghy=',hierarchy
plt.imshow(im)
plt.show()
