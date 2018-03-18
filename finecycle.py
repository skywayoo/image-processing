import  cv2
import matplotlib.pyplot as plt

img = cv2.imread('E:/bb.jpg',0)
gray=cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
print(img.shape)
circles= cv2.HoughCircles(img,cv2.HOUGH_GRADIENT,1,100,param1=100,param2=30,minRadius=1,maxRadius=5)
print(circles)
print(len(circles[0]))


for circle in circles[0]:
    print(circle[2])
    x=int(circle[0])
    y=int(circle[1])
    r=int(circle[2])
    print 'x=',x,'y=',y,'r=',r
    img=cv2.circle(img,(x,y),r,(0,0,255),-1)

plt.imshow(img)
plt.show()
