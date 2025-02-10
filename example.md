## Tidyverse example plot

    # This document is an short example

    mtcars_tb <- rownames_to_column(mtcars, var = "car") %>% 
      as_tibble()

    plot1 <- ggplot(data=mtcars_tb, mapping = aes(x=mpg, y=hp, label=car)) + geom_point() + geom_label() + ggtitle("Mileage vs Horsepower")

    plot1

![](example_files/figure-markdown_strict/unnamed-chunk-2-1.png)
