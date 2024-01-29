library(e1071)

DataScreeningStep1 <- function(Data) {
  DeleteData <- Data[c(-1), c(-1, -9, -11)]
  TempData <- DeleteData[, 1 : 9]
  V2 <- c()
  V3 <- c()
  V4 <- c()
  V5 <- c()
  V6 <- c()
  V7 <- c()
  V8 <- c()
  V10 <- c()
  V12 <- c()
  for (i in c(1 : length(TempData[, 1]))) {
    #if (TempData[i, 'V2'] == 0) {
    #  V2[i] = 'No'
    #} else {
    #  V2[i] = 'Yes'
    #}
    V2[i] = as.integer(TempData[i, 'V2'])
    V3[i] = as.integer(TempData[i, 'V3'])
    if (grepl('Mrs.', TempData[i, 'V4'])) {
      V4[i] = 1
    } else if (grepl('Sir.', TempData[i, 'V4'])) {
      V4[i] = 2
    } else if (grepl('Dr.', TempData[i, 'V4'])) {
      V4[i] = 3
    } else if (grepl('Major.', TempData[i, 'V4'])) {
      V4[i] = 4
    } else if (grepl('Master', TempData[i, 'V4'])) {
      V4[i] = 5
    } else if (grepl('Ms.', TempData[i, 'V4'])) {
      V4[i] = 6
    } else if (grepl('Miss.', TempData[i, 'V4'])) {
      V4[i] = 7
    } else if (grepl('Lady.', TempData[i, 'V4'])) {
      V4[i] = 8
    } else {
      V4[i] = 0
    }
    if (TempData[i, 'V5'] == 'male') {
      V5[i] = 0
    } else {
      V5[i] = 1
    }
    if (grepl('Sir.', TempData[i, 'V6']) && TempData[i, 'V6'] == '') {
      V6[i] = 36
    } else if (grepl('Dr.', TempData[i, 'V6']) && TempData[i, 'V6'] == '') {
      V6[i] = 37
    } else if (grepl('Major.', TempData[i, 'V6']) && TempData[i, 'V6'] == '') {
      V6[i] = 49
    } else if (grepl('Master', TempData[i, 'V6']) && TempData[i, 'V6'] == '') {
      V6[i] = 5
    } else if (grepl('Ms.', TempData[i, 'V6']) && TempData[i, 'V6'] == '') {
      V6[i] = 28
    } else if (grepl('Miss.', TempData[i, 'V6']) && TempData[i, 'V6'] == '') {
      V6[i] = 22
    } else if (grepl('Mrs.', TempData[i, 'V6']) && TempData[i, 'V6'] == '') {
      V6[i] = 37
    } else if (grepl('Lady.', TempData[i, 'V6']) && TempData[i, 'V6'] == '') {
      V6[i] = 48
    } else if (TempData[i, 'V6'] == '') {
      V6[i] = 33
    } else {
      V6[i] = as.integer(TempData[i, 'V6'])
    }
    V7[i] = as.integer(TempData[i, 'V7'])
    V8[i] = as.integer(TempData[i, 'V8'])
    V10[i] = as.integer(TempData[i, 'V10'])
    if (TempData[i, 'V12'] == 'C') {
      V12[i] = 0
    } else if (TempData[i, 'V12'] == 'Q') {
      V12[i] = 1
    } else {
      V12[i] = 2
    }
  }
  V10 <- as.integer(cut(as.integer(V10), breaks = 4, labels = c(0, 1, 2, 3)))
  NewData <- data.frame(V2 = V2, V3 = V3, V4 = V4, V5 = V5, V6 = V6, V7 = V7, V8 = V8, V10 = V10, V12 = V12)
  return(NewData)
}

DataScreeningStep2 <- function(Data) {
  DeleteData <- Data[c(-1), c(-1, -8, -10)]
  TempData <- DeleteData[, 1 : 8]
  V2 <- c()
  V3 <- c()
  V4 <- c()
  V5 <- c()
  V6 <- c()
  V7 <- c()
  V9 <- c()
  V11 <- c()
  for (i in c(1 : length(TempData[, 1]))) {
    V2[i] = as.integer(TempData[i, 'V2'])
    if (grepl('Mrs.', TempData[i, 'V3'])) {
      V3[i] = 1
    } else if (grepl('Sir.', TempData[i, 'V3'])) {
      V3[i] = 2
    } else if (grepl('Dr.', TempData[i, 'V3'])) {
      V3[i] = 3
    } else if (grepl('Major.', TempData[i, 'V3'])) {
      V3[i] = 4
    } else if (grepl('Master', TempData[i, 'V3'])) {
      V3[i] = 5
    } else if (grepl('Ms.', TempData[i, 'V3'])) {
      V3[i] = 6
    } else if (grepl('Miss.', TempData[i, 'V3'])) {
      V3[i] = 7
    } else if (grepl('Lady.', TempData[i, 'V3'])) {
      V3[i] = 8
    } else {
      V3[i] = 0
    }
    if (TempData[i, 'V4'] == 'male') {
      V4[i] = 0
    } else {
      V4[i] = 1
    }
    if (grepl('Sir.', TempData[i, 'V5']) && TempData[i, 'V5'] == '') {
      V5[i] = 36
    } else if (grepl('Dr.', TempData[i, 'V5']) && TempData[i, 'V5'] == '') {
      V5[i] = 37
    } else if (grepl('Major.', TempData[i, 'V5']) && TempData[i, 'V5'] == '') {
      V5[i] = 49
    } else if (grepl('Master', TempData[i, 'V5']) && TempData[i, 'V5'] == '') {
      V5[i] = 5
    } else if (grepl('Ms.', TempData[i, 'V5']) && TempData[i, 'V5'] == '') {
      V5[i] = 28
    } else if (grepl('Miss.', TempData[i, 'V5']) && TempData[i, 'V5'] == '') {
      V5[i] = 22
    } else if (grepl('Mrs.', TempData[i, 'V5']) && TempData[i, 'V5'] == '') {
      V5[i] = 37
    } else if (grepl('Lady.', TempData[i, 'V5']) && TempData[i, 'V5'] == '') {
      V5[i] = 48
    } else if (TempData[i, 'V5'] == '') {
      V5[i] = 33
    } else {
      V5[i] = as.integer(TempData[i, 'V5'])
    }
    V6[i] = TempData[i, 'V6']
    V7[i] = TempData[i, 'V7']
    V9[i] = as.integer(TempData[i, 'V9'])
    if (TempData[i, 'V11'] == 'C') {
      V11[i] = 0
    } else if (TempData[i, 'V11'] == 'Q') {
      V11[i] = 1
    } else {
      V11[i] = 2
    }
  }
  V9 <- as.integer(cut(as.integer(V9), breaks = 4, labels = c(0, 1, 2, 3)))
  NewData <- data.frame(V2 = V2, V3 = V3, V4 = V4, V5 = V5, V6 = V6, V7 = V7, V9 = V9, V11 = V11)
  return(NewData)
}

RpartModel <- function(Data) {
  x <- Data[, 2 : 9]
  y <- Data[, 1]
  Model <- svm(x, y, kernel = "radial", type = 'C-classification')
  return(Model)
}

PredictStep1 <- function(Data, Model) {
  x <- Data[, 2 : 9]
  y <- Data[, 1]
  ResultFrame <- data.frame(truth = y, pred = predict(Model, newdata = x, type = "class"))
  rtab <- table(ResultFrame)
  Probability <- (rtab[1, 1] + rtab[2, 2]) / sum(rtab)
  return(Probability)
}

PredictStep2 <- function(Data, Model) {
  x <- Data[, 1 : 8]
  pred = predict(Model, newdata = x, type = "class")
  return(pred)
}

args = commandArgs(trailingOnly = TRUE)
if (length(args) == 0) {
  stop("USAGE: Rscript hw5_107753001.R --fold n --train train.csv --test test.csv --report performance.csv --predict predict.csv", call. = FALSE)
} else {
  i <- 1 
  while (i < length(args)) {
    if (args[i] == "--fold") {
      Fold <- as.integer(args[i + 1])
      i <- i + 1
    } else if (args[i] == "--train") {
      Train <- args[i + 1]
      i <- i + 1
    } else if (args[i] == "--test") {
      Test <- args[i + 1]
      i <- i + 1
    } else if (args[i] == "--report") {
      Report <- args[i + 1]
      i <- i + 1
    } else if (args[i] == "--predict") {
      Predict <- args[i + 1]
      i <- i + 1
    } else {
      stop(paste("Unknown flag", args[i]), call. = FALSE)
    }
    i <- i + 1
  }
  
  if (length(grep(".csv", Train)) != 1) {
    Train <- paste0(Train, ".csv")
  }
  if (length(grep(".csv", Test)) != 1) {
    Test <- paste0(Test, ".csv")
  }
  if (length(grep(".csv", Report)) != 1) {
    Report <- paste0(Report, ".csv")
  }
  if (length(grep(".csv", Predict)) != 1) {
    Predict <- paste0(Predict, ".csv")
  }
  Data <- read.csv(Train, header = F)
  NewData <- DataScreeningStep1(Data)
  Spacing <- floor(length(NewData[, 1]) / Fold)
  RandomIndex <- sample(1 : length(NewData[, 1]), length(NewData[, 1]), replace = FALSE)
  ExchangeData <- NewData[RandomIndex, ]
  set <- c()
  training <- c()	
  validation <- c()	
  test <- c()
  for (i in 1 : Fold) {
    TrainData <- ExchangeData
    TestIndex <- ((i - 1) * Spacing + 1) : (Spacing * i)
    TestData <- ExchangeData[TestIndex, ]
    if ((i + 1) %% Fold == 0) {
      n <- Fold
      ValidationIndex <- ((n - 1) * Spacing + 1) : (Spacing * n)
    } else {
      n <- (i + 1) %% Fold
      ValidationIndex <- ((n - 1) * Spacing + 1) : (Spacing * n)
    }
    ValidationData <- ExchangeData[ValidationIndex, ]
    DeleteIndex <- c(TestIndex, ValidationIndex) * (-1)
    TrainData <- TrainData[DeleteIndex, ]
    set[i] <- paste0("fold", i)
    Model<- RpartModel(TrainData)
    training[i] <- round(PredictStep1(TrainData, Model), 2)
    validation[i] <- round(PredictStep1(ValidationData, Model), 2)
    test[i] <- round(PredictStep1(TestData, Model), 2)
  }
  set[i + 1] <- "ave."
  training[i + 1] <- round(mean(training), 2)
  validation[i + 1] <- round(mean(validation), 2)
  test[i + 1] <- round(mean(test), 2)
  result <- data.frame(set = set, training = training, validation = validation, test = test)
  write.table(result, file = Report, quote = F, sep = ",", row.names = F, na = "NA")
  
  Model<- RpartModel(NewData)
  PredictData <- read.csv(Test, header = F)
  PassengerId <- c()
  Survived <- c()
  NewPredictData <- DataScreeningStep2(PredictData)
  PassengerId <- PredictData[2 : length(PredictData[, 1]), 1]
  for (i in 1 : length(NewPredictData[, 1])) {
    if (PredictStep2(NewPredictData[i, ], Model) == 1) {
      Survived[i] <- 0
    } else {
      Survived[i] <- 1
    }
  }
  result2 <- data.frame(PassengerId = PassengerId, Survived = Survived)
  write.table(result2, file = Predict, quote = F, sep = ",", row.names = F, na = "NA")
}
