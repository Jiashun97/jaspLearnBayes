#library(jaspTools)
#setupJaspTools()
#library(jaspTools)
#library(testthat)

#jaspTools::runTestsTravis(module = getwd())

## two players
{
  options <- analysisOptions("LSgameofskill")
  options$winPoints <- 4
  options$players <- list(list(values = c(1, 1)), list(values = c(2, 3)))
  set.seed(1)
  dataset <- NULL
  results <- runAnalysis("LSgameofskill", dataset, options)#, makeTests = TRUE)
  
  
  test_that("Probability of Player 1 Winning plot matches", {
    plotName <- results[["results"]][["CIPlot"]][["data"]]
    testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
    jaspTools::expect_equal_plots(testPlot, "probability-of-player-1-winning-two-players", dir="LSgameofskill")
  })
  
  test_that("Summary Table results match", {
    table <- results[["results"]][["summaryTable"]][["data"]]
    jaspTools::expect_equal_tables(table,
                                   list(0.0476190476190477, 0.044, 1, 1, 1, 
                                        0.952380952380952, 0.956, 2, 3, 2))
  })
}



## three players
{
  options <- analysisOptions("LSgameofskill")
  options$winPoints <- 4
  options$players <- list(list(values =  c(1,1)), list(values = c(1, 2)), list(values = c(2, 3)))
  set.seed(1)
  dataset <- NULL
  results <- runAnalysis("LSgameofskill", dataset, options, makeTests = TRUE)
  
  
  test_that("Probability of Player 1 Winning plot matches", {
    plotName <- results[["results"]][["CIPlot"]][["data"]]
    testPlot <- results[["state"]][["figures"]][[plotName]][["obj"]]
    jaspTools::expect_equal_plots(testPlot, "probability-of-player-1-winning-three-players", dir="LSgameofskill")
  })
  
  test_that("Summary Table results match", {
    table <- results[["results"]][["summaryTable"]][["data"]]
    jaspTools::expect_equal_tables(table,
                                   list(0.0307692307692308, 0.034, 1, 1, 1, 
                                        0.158041958041958, 0.14, 2,2, 1, 
                                        0.811188811188807, 0.826, 3, 3, 2))
  })
}


#to avoid version mismatches between plots from different analyses please validate ALL plots
#jaspTools::manageTestPlots()

#jaspTools::testAnalysis("LSgameofskill)
#jaspTools::manageTestPlots("LSgameofskill")


