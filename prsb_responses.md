
## Referee: 1

> One additional reference that might be worth mentioning is O. Diekmann, H. Heesterbeek, and H. Metz,The legacy of Kermack and McKendrick, in Epidemic Models, Their Structure and Relation to Data (D. Mollinson, ed.) (1995), pp.95-115.

Thanks. We now cite this article as an early mentioner of the little-r threshold.

## Referee: 2

> In this work the authors propose that “strength” and “speed” are complementary frameworks for understanding interventions in infectious disease models. This is an interesting and appealing idea based on simple re-arrangements of well-known equations for exponentially growing epidemics. As the authors themselves note, comparing growth rates r rather than reproductive numbers R is already well known in ecology. 

> In my view this paper could bring these ideas to light in infectious disease more thoroughly and compellingly with an expanded application section, a section on the relationship to data and/or estimation from data, improved and expanded section on interventions and the distinct views provided by (and usefulness of) the two distinct frameworks, and/or with some extension of the results to population dynamics that differ from constant rate exponential growth or decay. As it stands it feels quite minimal, though I appreciate the appeal of the conceptual point.

Thanks for this feedback. We agree that these ideas are similar to ideas that have been discussed in the ecological context, but also feel that this is a perspective sorely lacking in the disease-modeling world.

We have expanded the application section with examples from COVID-19. To our mind, these examples further underline the absence of r-based thinking in the disease-modeling world. We also address more explicitly the link between the parameters of the initial phase and the prospects for long-term control. We feel that issues dealing directly with non-exponential disease dynamics are complicated enough for another paper.

> Near equation (9) the authors need to make a more explicit link with survival analysis so that we are clear on why we multiply K by survival functions. Survival functions multiply in the sense that if there are two hazards at rates lambda1 and lambda2 then the survival function is S(t) = S1(t) S2(t) . But K(tau) is proportional to the density g(tau), and is not a survival function. What is the interpretation of the density times the survival function? Why would the interventions not change the density directly, so that g becomes ghat (and then this would impact the hazard rate and survival function via the usual relationship S(t) = \int_t ^\infty ( ghat (x) dx )  ) ?

We have expanded (9) into two steps and attempted to explain the logic clearly.

> In practice what is the need for equations (6) and (12)? Both essentially re-write the other equations; are these averages that can be linked to estimates from data, for example?

We think that the value of (6) and (12 -- now 13) is conceptual. We have added explanations following these derivations. In retrospect, we believe that Ss 2.2 and 2.3 were written in too "mathematical" a style: we got a bit carried away with the formal parallelism. The new version is still short, but engages more with the biological concepts.

> Presumably both frameworks give a decline when the growth rate is negative and growth when it is positive. Therefore they would never contradict each other as to whether an intervention was sufficient or not - is this correct? This should be made explicit. 

This is correct, and we have worked to be more explicit.

> It would also be good to more explicitly state and discuss what the differences are. I realize that this is in the discussion and in some sense in Figure 4, but I found the discussion section vague, particularly since the analysis is only relevant for the case of exponential growth. In particular, where would the two frameworks give different estimates of the uncertainty surrounding the benefits of an intervention, or the comparison between two interventions?

We never expect to get a different final answer from the two formalisms; they are two ways of doing essentially the same calculation. We have tried to be more clear about this as mentioned above. We do expect in some cases to be able to use one formalism or another to more clearly illuminate the key issues and quantities determining the detailed answer, as we try to explain in our HIV example and in our new COVID example.

> On a minor note, since condoms are ultimately an individual choice applied to individual (potential) transmission events, why are they a population-level intervention whereas test and treat is deemed individual? More details on why the two frameworks give different intuition or analytical capacity would be good.

Thanks for this. We were using individual to mean targeted at infectious individuals, and population to mean targeted at everyone. We have now dropped these shortcuts, and we simply explain this directly.

> In Figures 3 and 4, the black lines are not clear to me -- the strength is defined as R/Rhat and the speed as rhat -r . So what is the strength (or speed) of “the epidemic” (black lines) - what’s Rhat and what’s R? It might be good to have some prevalence curves

We define strength and speed of the epidemic in the introduction, and compare these to strength and speed of intervention efforts. We now reiterate these points (including in the figure captions).

> Minor quibble: equation (4) has L described in words as the “average proportional reduction” but where the reduction is 75%, in fact the denominator is 4 (1 / (1-0.75) ) -- rephrase.

Done, thanks.
