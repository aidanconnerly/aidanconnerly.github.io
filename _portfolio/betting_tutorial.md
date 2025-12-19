---
title: "An Introduction to Quantitative Sports Betting"
excerpt: "My comprehensive guide to profitable sports betting (and how I got banned) <br/><img src='/images/sports_betting/montecarlo2.png' style='width: 350px; height: auto'>"
collection: portfolio
permalink: /portfolio/sports_betting/
layout: archive
---
*A comprehensive guide to profitable sports betting (and how I got banned)*

## Introduction
As a recent college graduate, I've noticed many of my friends getting into sports betting. Given that you can't watch a football game without seeing 500 ads from FanDuel and DraftKings, I'm not surprised. I'm a sports fan who enjoys poker and other games of probability, so sports betting naturally caught my interest. I spent a few weeks learning how it all worked, then deposited a small amount into my first account to see if I could beat the bookies.

<figure style="display: flex; justify-content: center; gap: 20px; text-align: center;">
    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/DKad.png"  
             alt="DraftKings ad" 
             style="max-width: 250px; height: auto;" />
    </div>

    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/betmgmad.jpg"  
             alt="BetMGM ad" 
             style="max-width: 250px; height: auto;" />
    </div>

    <figcaption style="width: 100%; text-align: center;">
        Sportsbook ads you've probably seen
    </figcaption>
</figure>

In just three months, I placed over 2500 wagers and made more than $$\$5000$$ in profit. These days, some sportsbooks won't even let me bet more than a few dollars. While that's a drop in the bucket compared to the volume of professional bettors, I learned a ton about the gambling industry, how betting markets work, and even a bit about sports along the way.

<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/sports_betting/profitgraph2.png" 
         alt="Coin Flip" 
         style="display: block; margin: auto; max-width: 600px; height: auto;" />
    <figcaption>
        My profit graph from September to December 2024
    </figcaption>
</figure>

But how do DraftKings and FanDuel make money in the first place? How do people profit from sports betting? In this post, I'll break down how sportsbooks work and share basic strategies advantage players use to win.

## The Vig
Everyone knows that the "house always wins" -- but why? Simply put, when you place a wager, whether that be on roulette, slots, or sports, the casino pays out **less than what is mathematically fair** for a win. This is the so-called "house edge".

__Let's look at a toy example:__
Imagine you're at a casino betting on a coin flip. Assuming you wager $10, and that the coin is fair (that is, a 50-50 chance of landing heads or tails), what would be a fair payout?

<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/sports_betting/coinflip.jpg" 
         alt="Coin Flip" 
         style="display: block; margin: auto; max-width: 300px; height: auto;" />
    <figcaption>
        What would be a fair payout for winning a coin flip?
    </figcaption>
</figure>


The answer is $20, or more generally, 2x your wager. Why does this make sense? On average, you win just as often as you lose, so over many bets, your gains and losses should balance out leaving you with no net profit or loss. A fair payout ensures that, on average, you break even in the long run.

Mathematically, we say that if the **expected value (EV)** of a bet is zero, then the bet is **fair**:

$$EV = P(\text{Win}) * (\text{\$ Profit}) - P(\text{Lose}) * (\text{\$ Wager})$$

Setting $$EV = 0$$ and $$P(\text{Lose}) = 1 - P(\text{Win})$$, we can solve for the fair payout:

$$\text{\$ Fair Profit} = \frac{(1 - P(\text{Win})) * (\text{\$ Wager})}{P(\text{Win})}$$

Of course, casinos need to turn a profit. In our example, let's say the casino pays out 1.9x (-111 in <a href="https://www.nytimes.com/athletic/2497657/2022/01/25/understanding-sports-betting-odds-and-how-to-read-them/" target="_blank" style="color: #0066cc; text-decoration: underline;">American odds</a>) your wager for a win. If two people each bet $10—one on heads and the other on tails—the casino collects $20 upfront. No matter which side the coin lands on, the casino only pays $19 to the winner, keeping $1 as profit.

Mathematically, a 1.9x payout would be fair if your chance of winning were $$52.6\%$$—a value known as the **implied probability**. Now, let's sum the implied probabilities for all outcomes:

$$P_{\text{implied}}(H) + P_{\text{implied}}(T) = 52.6\% + 52.6 \% = 105.2\%$$

This extra $$5.2\%$$ is called the **vigorish** (also known as the vig, juice, or house edge). It's the sportsbook's fee for processing bets, and its size can vary depending on the market.

Let's simulate the above scenario for 50 players betting $10 each 1000 times:
<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/sports_betting/montecarlo1.png" alt="Monte Carlo Sims" style="display: block; margin: auto;" />
    <figcaption>
    Green: player who ended in profit | Red: player who ended in a loss
</figcaption>
</figure>
Only $$3/50$$ ($$6\%$$) of players were profitable! The average final balance was $$-\$494$$, meaning our imaginary casino netted roughly $$\$25000$$!

### Example Vig Calculations
Sportsbooks tend to apply a higher vig to markets with less confidence due to limited liquidity or data. Let's calculate the vig for a few real examples.

Here are the odds for an NBA game between the Lakers and Warriors from Pinnacle, one of the sharpest sportsbooks. Since the NBA is a highly popular league with tons of data and heavy betting activity, the vig should be relatively low:
<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/sports_betting/pinny_vig.png" 
         alt="Pinnacle Vig" 
         style="display: block; margin: auto; max-width: 500px; height: auto;" />
    <figcaption>
        Example line from Pinnacle
    </figcaption>
</figure>

$$
\begin{aligned}
P_{\text{Lakers}} = \frac{100}{100 + 150} &= 0.4 \\
P_{\text{Warriors}} = \frac{168}{100 + 168} &= 0.627 \\
P_{\text{Lakers}} + P_{\text{Warriors}} &= 1.027 \\
\end{aligned}
$$

This line has a $$2.7\%$$ vig, a sign that Pinnacle is highly confident in its odds.

Let's now look at a random table tennis match I found on DraftKings:
<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/sports_betting/dk_vig.png" 
         alt="Pinnacle Vig" 
         style="display: block; margin: auto; max-width: 450px; height: auto;" />
    <figcaption>
        Example line from DraftKings
    </figcaption>
</figure>

$$
\begin{aligned}
P_{\text{Dosz}} = \frac{300}{100 + 300} &= 0.75 \\
P_{\text{Sporek}} = \frac{100}{100 + 195} &= 0.339 \\
P_{\text{Dosz}} + P_{\text{Sporek}} &= 1.089 \\
\end{aligned}
$$

As expected, we see a much higher vig at $$8.9\%$$. DraftKings likely has much less betting activity and data to be confident in this line, so the increased vig provides a cushion to protect against potential mispricing errors.

## Exploiting Market Inefficiencies
Sportsbooks calculate betting odds using statistical models, historical data, and input from sharp bettors, creating *markets* that reflect public opinion and information. Companies like FanDuel and DraftKings hire top-tier analysts and data scientists to price their lines accurately.

In an *efficient market*, the odds accurately reflect true probabilities, leaving little room for bettors to find an edge. Mainstream markets like NFL moneylines tend to fall into this category. However, sportsbooks are profit-driven and aim to maximize user engagement. For a single game, they often offer hundreds of *inefficient markets*, such as 3rd quarter touchdown scorers:

<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/sports_betting/example_prop.JPG" 
         alt="Example Props" 
         style="display: block; margin: auto; max-width: 300px; height: auto;" />
    <figcaption>
        Example prop bets from DraftKings
    </figcaption>
</figure>

All successful sports bettors profit by identifying wagers where the true probability of winning is higher than what the sportsbook's odds suggest. Let's revisit the coin flip example, but this time, the casino mistakenly prices the odds at +110 (a 2.1x payout):
<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/sports_betting/montecarlo2.png" alt="Monte Carlo Sims" style="display: block; margin: auto;" />
    <figcaption>
    Green: player who ended in profit | Red: player who ended in a loss
</figcaption>
</figure>
This time, $$47/50$$ ($$94\%$$) of players were profitable, with an average final balance of $$\$576$$ (note: one can calculate the EV of this scenario to be $$\$550$$ using a binomial distribution).

Of course, the coin flip example is simple because we know the exact probability of heads. But how can we estimate the true probabilities for something as unpredictable as an NBA game?

To identify good bets, there are two main approaches

1. **Bottom-Up:** Bottom-up bettors create independent models to predict outcomes, then compare the model's probabilities to the odds offered by sportsbooks. For example, if the bettor's model suggests a a team has a $$45\%$$ chance of winning while the sportsbook's implied probability is $$40\%$$, then the bettor has identified a potential value bet.
- __Pros__: develop independent edges, potential for higher returns
- __Cons__: requires extensive data and sports knowledge, hard to quantify your edge, need to specialize in a niche market

2. **Top-Down:** Top-down bettors compare odds across many sportsbooks to look for discrepancies. If 10 books are offering +100 odds ($$50\%$$ implied probability) for a bet while DraftKings offers +110 ($$47.6\%$$ implied probability), there is likely value in betting on the DraftKings line. 
- __Pros__: requires minimal sports knowledge, follow opinions of professional bettors, quantifiable edge
- __Cons__: need to constantly monitor odds, lines move fast, smaller profit margin

The most profitable bettors use a combination of the two: bottom-up to generate a prediction and top-down to find the best odds. In my case, I exclusively used a top-down approach since I didn't have the expertise or resources to develop my own models. 

Top-down betting requires software to monitor odds across many sportsbooks. One of the sites that I regularly use is <a href="https://crazyninjaodds.com/" target="_blank" style="color: #0066cc; text-decoration: underline;">CrazyNinjaOdds</a>. While you can find many other paid services, be cautious about spending hundreds of dollars per month unnecessarily.

## Which sportsbooks should we trust?
Sportsbooks fall into three categories: **market maker**, **retail**, and **exchange**. Interpreting lines correctly requires understanding the differences between sportsbooks.

### Market Making Sportsbooks
<figure style="display: flex; justify-content: center; gap: 20px; text-align: center;">
    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/pinnaclelogo.jpg"  
             alt="Pinnacle logo" 
             style="max-width: 100px; height: auto;" />
    </div>

    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/circalogo.png"  
             alt="Circa logo" 
             style="max-width: 150px; height: auto;" />
    </div>

    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/bookmakerlogo.jpg"  
             alt="Bookmaker logo" 
             style="max-width: 100px; height: auto;" />
    </div>

    <figcaption style="width: 100%; text-align: center;">
        Market-making books: Pinnacle, Circa, Bookmaker
    </figcaption>
</figure>

Market making books *willingly* accept bets from sharp bettors to calibrate their odds. Their business model relies exclusively on offering the lowest-vig lines, so you won't find any flashy profit boosts or outlandish prop bets. Market makers know how to differentiate sharp and casual players to adjust their lines appropriately. This process transforms the odds into a collective average of sharp, expert models (see: <a href="https://en.wikipedia.org/wiki/Wisdom_of_the_crowd" target="_blank" style="color: #0066cc; text-decoration: underline;">wisdom of the crowd</a>). Instead of building our own models, we can use odds set by market makers as a reliable benchmark for how a line should be priced (at no cost!).

The most well-known market making sportsbooks include:
- Pinnacle
- Circa
- Bookmaker

### Retail Sportsbooks
<figure style="display: flex; justify-content: center; gap: 20px; text-align: center;">
    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/draftkingslogo2.png"  
             alt="DraftKings logo" 
             style="max-width: 100px; height: auto;" />
    </div>

    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/fanduellogo2.jpg"  
             alt="FanDuel logo" 
             style="max-width: 100px; height: auto;" />
    </div>

    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/betmgmlogo.png"  
             alt="Betmgm logo" 
             style="max-width: 100px; height: auto;" />
    </div>

    <figcaption style="width: 100%; text-align: center;">
        Retail books: DraftKings, FanDuel, BetMGM
    </figcaption>
</figure>
Retail sportsbooks are the big-name brands you've seen in countless ads and sponsorships. Unlike market-makers, their business model focuses on attracting casual bettors who are unconcerned with odds accuracy. Retail books invest heavily in marketing and often outsource odds pricing to third parties. To keep customers engaged, they offer enticing bonuses, odds boosts, and prop bets. 

While some retail books use their own models and accept bets from sharp players, their primary audience is the casual bettor. As a result, they impose betting limits on sharp players to protect their bottom line. 

Personaly, I've been limited on many books to $$\$10$$ or less per bet. 

<figure style="display: flex; justify-content: center; gap: 20px; text-align: center;">
    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/fanatics_limit.JPG"  
             alt="Limited on Fanatics" 
             style="max-width: 250px; height: auto;" />
    </div>

    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/DK_limited.png"  
             alt="Limited on DraftKings" 
             style="max-width: 250px; height: auto;" />
    </div>

    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/MGM_limited.jpeg"  
             alt="Limited on BetMGM" 
             style="max-width: 300px; height: auto;" />
    </div>

    <figcaption style="width: 100%; text-align: center;">
        Fanatics, DraftKings, and BetMGM limited me to $10 or less
    </figcaption>
</figure>

The most well-known retail sportsbooks include:
- FanDuel
- DraftKings
- BetMGM
- Caesar's
- Fanatics
- BetRivers

### Betting Exchanges
<figure style="display: flex; justify-content: center; gap: 20px; text-align: center;">
    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/prophetxlogo.jpg"  
             alt="ProphetX logo" 
             style="max-width: 100px; height: auto;" />
    </div>

    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/rebetlogo.jpg"  
             alt="Rebet logo" 
             style="max-width: 100px; height: auto;" />
    </div>

    <div style="display: block; margin: auto; text-align: center;">
        <img src="{{aidanconnerly.github.io}}/images/sports_betting/noviglogo.jpg"  
             alt="Novig logo" 
             style="max-width: 100px; height: auto;" />
    </div>

    <figcaption style="width: 100%; text-align: center;">
        Sportsbook exchanges: ProphetX, Rebet, Novig
    </figcaption>
</figure>

In betting exchanges, bettors act as market makers, meaning you're betting against other people rather than the casino. Exchanges make money by charging a small fee for facilitating each bet, meaning their business model prioritizes maximizing betting volume. This structure allows betting exchanges to offer competitive lines, especially in high limit/liquidity markets. Before making any conclusions about how sharp an exchange's lines are, you must consider the liquidity and betting limits of the market. Since you're not playing against the house, betting exchanges don't impose limits on winning players.

The most well-known betting exchanges include:
- ProphetX
- Rebet
- Novig
- Sporttrade

### Why does this matter?
Especially in top-down betting strategies, understanding how various sportsbooks operate is key to spotting bets with positive EV. One should note that not all sportsbooks fall neatly into "retail" or "market making" categories. For example, FanDuel is well-known for having some of the sharpest player prop lines, even though they have many "retail" lines. Knowing which sportsbooks are sharp in specific areas can give you a larger edge. Check out <a href="https://www.pikkit.com/blog/which-sportsbooks-are-sharp" target="_blank" style="color: #0066cc; text-decoration: underline;">this article</a> for a deeper dive into which sportsbooks are sharp in different areas.

## Bet Sizing with the Kelly Criterion
The **Kelly Criterion** is a popular formula used in gambling, investing, and trading to optimize bankroll growth. I won't get into the proof, but the formula calculates the ideal bet size to maximize long-term growth. Let's take a look at the formula:

$$f = \frac{bp-q}{b}$$

- $$f = $$ fraction of bankroll to bet
- $$b = $$ decimal odds of the bet (<a href="https://www.nytimes.com/athletic/2544857/2022/01/27/how-to-read-decimal-odds-in-sports-betting/" target="_blank" style="color: #0066cc; text-decoration: underline;">What are decimal odds?</a>)
- $$p = $$ probability of winning the bet
- $$q = $$ probability of losing the bet ($$1-p$$)

Intuitively, the Kelly Criterion suggests larger bet sizes when you have a greater edge or a higher probability of winning. It balances the risk and reward to grow your bankroll efficiently

### Fractional Kelly
The Kelly formula relies on *perfect* knowledge of the probablity of winning, but in practice, we can only make educated guesses based on models and market data. For top-down bettors, these probabilities often come from a weighted average of market odds.

To avoid overestimating an edge, many bettors use **fractional Kelly**, which applies a **Kelly multiplier**—a fraction of the full Kelly recommendation. Most people use $$1/4$$ and $$1/3$$, but your multiplier should reflect your confidence in your probability estimate. More confidence means a higher multiplier; less confidence calls for caution.

## The Steps in Advantage Play
Now that you're familiar with how advantage sports betting works, here's a roadmap to follow:

1. **Sign up for every available sportsbook**  
   Creating as many accounts as possible ensures you have access to the best available line.

2. **Find +EV lines**  
   Identify lines where the implied probability (from the sportsbook's odds) is lower than your calculated probability of the outcome. You can do this by comparing odds across sharp sportsbooks and using your own model to estimate probabilities.

3. **Determine bet size**  
   Use the **fractional Kelly criterion** to calculate your optimal bet size.

4. **Repeat**  
   Winning sports bettors work with thin margins (I typically have about a $$5\%$$ edge). You have to place thousands of bets to realize your advantage.

5. **Profit!**  
   Trust in the math and let the numbers do the work.


## Sports Betting and Beyond
This guide provides a small glimpse into the fundamentals of advantage sports betting. There are countless other ways to find edges, such as arbitrage and middle betting, exploiting parlay correlations, or capitalizing on market movements. However, as your bet size grows, the greatest challenge for advantage bettors becomes dealing with sportsbook limits. Over time, the "game" shifts from simply finding +EV bets to developing creative strategies for maximizing how much money you can get down.

What fascinates me most about betting markets is their ability to serve as a central aggregate of information, reflected directly in probabilities. And this doesn't stop at sports. During the 2024 election, I closely followed betting odds on platforms like Polymarket. Much like in sports, election betting markets have proven to be remarkably reliable predictors of outcomes. If you're curious about the accuracy of these odds, check out <a href="https://electionbettingodds.com/TrackRecord.html" target="_blank" style="color: #0066cc; text-decoration: underline;">this article</a>.

Markets teach us how to think probabilistically, identify inefficiencies, and manage risk—skills that extend beyond betting and into everyday decision making. Even in the face of uncertainty, patterns, and opportunities emerge for those who know where to look.