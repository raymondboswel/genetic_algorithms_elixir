# One max algorithm implemantation

population = for _ <- 1..100, do: for _ <- 1..1000, do: Enum.random(0..1)
evaluate = fn population -> ... end
selection = fn population -> ... end
crossover = fn population -> ... end

algorithm =
fn population, algorithm ->
  best = Enum.max_by(population, &Enum.sum/1)
  IO.write("\rCurrent Best: " <> Integer.to_string(Enum.sum(best)))
  if Enum.sum(best) == 1000 do
    best
  else
    population # Initial Population
    |> evaluate.() # Evaluate Population
    |> selection.() # Select Parents
    |> crossover.() # Create Children
    |> algorithm.(algorithm) # Repeat the Process with new Population
  end
end
