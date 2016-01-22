#http://swcarpentry.github.io/r-novice-gapminder/08-plot-ggplot2.html
library(gapminder)
library(ggplot2)

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) + geom_point()



ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) + geom_point()
# ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap, color = continent)) + geom_point()

ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line()


ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line() + geom_point()

ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country)) +
  geom_line(aes(color=continent)) + geom_point()


ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country)) +
  geom_point() + geom_line(aes(color=continent))

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) +
  geom_point() + scale_y_log10()

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) +
  geom_point() + scale_y_log10() + geom_smooth(method="lm")

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) +
  geom_point() + scale_y_log10() + geom_smooth(method="lm", size = 1.5)

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) +
  geom_point(size = 3, color = "red") + scale_y_log10()

ggplot(data = gapminder, aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + facet_wrap( ~ country)

ggplot(data = gapminder, aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + facet_wrap( ~ country) +
  xlab("Year") + ylab("Life expectancy") + ggtitle("Figure 1") +
  scale_fill_discrete(name="Continent") +
  theme(axis.text.x=element_blank(), axis.ticks.x=element_blank())

ggplot(data = gapminder, aes(x = gdpPercap, fill = continent)) + geom_density() +
  scale_x_log10() + facet_wrap(~ year)
