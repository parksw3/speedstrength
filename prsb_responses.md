
## Associate Editor

> The referees are generally positive about the changes that were
> made to the manuscript. However, one reviewer continues to raise
> important questions about the covid-19 example - and also about
> whether an example of this type is possible. I strongly recommend
> that these points are carefully reflected upon and new discussion is
> included in the next version. Overall, I think that this is a very
> good contribution to the epidemic modelling literature. I might not
> have thought that before 2020 but this pandemic has made me think
> differently.

Thank you for your help with this MS, and for your willingness to help us find a middle ground. We have maintained our focus on counterfactuals involving known, and roughly constant, values of r and R, but now explain this a little better. Crucially, we have changed the way we talk about our counterfactuals, in a way we think will be helpful to readers like Referee 2. We are now much more careful to clarify when we are talking about our pre-intervention assumptions, and we avoid a former confusion between generic values and pre-intervention values by using an explicit subscript "pre".

## Referee: 1

> This paper really extends our understanding of epidemic models

Thank you for your help with this MS, and for your positive words.

## Referee: 2

Thank you for your continued patience and work to help us improve this MS.

> The authors have addressed most of the concerns but have not opted
> to include non-constant growth, estimation or the other topics,
> preferring instead to focus on their main conceptual point. in the
> midst of a pandemic, infectious disease modelers are busy, so this
> is understandable and the Editors need to decide whether they would
> have preferred the authors to expand.

> The main change in this new version is the COVID-19 example, in
> which the authors describe in words (but do not model or justify with
> mathematics) how their framework helps to interpret the relationship
> between presymptomatic transmission and control. They say that an
> increase in the estimated importance of presymptomatic transmission
> might be expected to increase the difficulty of control, but that
> more early transmission for a given r means less transmission per
> individual, so that controls are actually easier. I think this example
> does not help because it is unclear for the reasons below.

> Consider the example of a policy ensuring that symptomatic people
> self-isolate (a school or workplace might have such a policy, sending
> everyone with symptoms home immediately). This reduces transmission,
> but what transmission remains is from  a- and pre-symptomatic
> individuals. Here, the growth rate r isn’t fixed - there’s less
> transmission. The “importance” of pre-symptomatic transmission
> is higher, though. So this is perhaps not an example, but what is an
> intervention other than something targeting symptomatic individuals
> that would accomplish such a shift and why would it leave r constant?.

> The crux of the argument is the phrase “for a given r” -- and
> use of the generic “importance” instead of either “amount”
> or “fraction” ( both of which would have made clear whether the
> intervention reduces the total transmission by reducing transmission
> after symptoms, or does something else that shifts the timing of
> transmission). Also in this particular case, with the policy that
> symptomatics go home, actually other interventions (like contact
> tracing) do get harder in the sense that earlier transmission is harder
> to stop by contact tracing, even if less of it is needed because the
> total number of transmissions expected has been reduced.

> I think the other reason it’s not quite right is that it’s hard to
> think of an intervention that would leave the rate of growth fixed but
> change the timing of transmission (so changing the relationship between
> R and the rate of growth by changing the generation interval). So
> the conditioning on constant r is a little hard to picture.

We feel this is a problem with our explanation, not with our argument. We have broadened our attempts to explain our conceptual framework (see below).
In particular, in no case do we imagine an intervention that leaves r fixed: what we are fixing is the the _pre-intervention_ value of r in our two examples. The idea is that r_pre has been observed more clearly than R or the generation interval for HIV and for COVID-19, so when we change our estimate of g_pre (called g in the MS), it changes our estimate of R_pre while leaving r_pre fixed.

> In the response document there are many points where the authors note
> that R might not be constant but r might be, or vice versa. Concrete
> examples would help. I could imagine that constant R (people infect
> the same mean number) but different r (they do so more or less
> quickly) could occur if the course of viral infection within the host
> changes (for genetic or host reasons) ; if people compensate for good
> symptomatic testing by taking more risks before symptoms.. reaching
> the same R but at a different time in their infection; but these feel
> quite just-so and I am left with the same sense of reaching for a
> concrete example that I had in the last version.

These comments are very useful in underlining how we've explained poorly. The issues about what counter-factuals to account for in thinking about “initial” values of r and R are complicated, and we lazily tried to avoid them. This  made our submissions harder to follow than they should have been.

We now systematically use the subscripts pre and post for both r and R, and have tried to make clear that it is r_pre that we are assuming is known in the examples discussed above.
We believe that this has made our paper substantially easier to read, and thank the reviewer for the patience that it took to help us see that we needed to be more clear.
