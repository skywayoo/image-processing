fancy_pca = function(fp,num,std){
  require(imager)
  image = load.image(fp)
  img_h = dim(image)[2]
  img_w = dim(image)[1]
  image = do.call(cbind,list(as.vector(image[,,1,1]),as.vector(image[,,1,2]),as.vector(image[,,1,3])))
  image_pca = prcomp(image,scale. = T)
  eigen_val = image_pca$sdev^2
  eigen_vec = image_pca$rotation
  fancy_pca_image = list()
  for(n in 1:num){
    cat("processing number",n,"photo","\n")
    new_image = image
    alpha = rnorm(3,0,std)
    w = alpha * eigen_val
    dim(w) = c(1,3)
    add = eigen_vec %*% t(w)
    for(i in 1:dim(new_image)[1]){
      new_image[i,1] = new_image[i,1] + add[1]
      new_image[i,2] = new_image[i,2] + add[2]
      new_image[i,3] = new_image[i,3] + add[3]
    }
    dim(new_image) = c(img_w,img_h,1,3)
    fancy_pca_image[[n]] = as.cimg(new_image)
    new_path = sprintf("fancy_pca%s.jpg",1:num)[n]
    save.image(new_image,new_path) 
  }
  return(fancy_pca_image)
}
