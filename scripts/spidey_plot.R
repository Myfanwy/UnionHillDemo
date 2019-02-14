library(ggplot2)
library(magick)
library(tibble)

power <- 1:10
responsibility <- 1:10

spidey <- as.tibble(cbind(power, responsibility))

s1 <- ggplot(spidey, aes(x = power, y = responsibility)) +
  geom_line() +
  theme_minimal() +
  labs(x = "Power", y = "Responsibility") +
  theme(axis.text = element_blank(),
        axis.title = element_text(size = 20),
        axis.line = element_line(size = 0.8))

#ggsave(s1, file="figs/powerVresponsibility.png", width = 5, height = 4, dpi = 300)

background <- image_background(image_read("figs/powerVresponsibility.png", "200"), "white", flatten = TRUE)
background
spid <- image_read("figs/spideydancing1.gif") 
frames <- image_apply(spid, function(frame) {
  image_composite(background, frame, offset = "+70+30")
})

# Turn frames into animation
animation <- image_animate(frames, fps = 10)
image_write(animation, "figs/powerVresponsibility.gif")
print(animation)