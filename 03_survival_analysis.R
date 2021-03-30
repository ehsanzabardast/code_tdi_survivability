#-----------------------------------
# Cleaning
#-----------------------------------

# Clear plots
if(!is.null(dev.list())) dev.off()
# Clear console
cat("\014") 
# Clean workspace
rm(list=ls())

#-----------------------------------
# NOTE: set the working directory
#       to the scripts folder
#-----------------------------------

setwd("~/example/git/directory")

#-----------------------------------
# Required Packages
#-----------------------------------

require(survival)
require(ranger)
require(ggplot2)
require(dplyr)
require(plyr)
require(ggfortify)
require(survminer)
require(scales)
options(scipen = 999)

#-----------------------------------
# Data Preparation
#-----------------------------------

commons.compress.data <- 
    read.csv("data/commons_compress_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
             )
commons.compress.data$project_name <- "Commons Compress"

commons.geometry.data <- 
    read.csv("data/commons_geometry_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
             )
commons.geometry.data$project_name <- "Commons Geometry"

cxf.data <- 
    read.csv("data/cxf_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
cxf.data$project_name <- "CXF"

groovy.data <- 
    read.csv("data/groovy_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
groovy.data$project_name <- "Groovy"

hadoop.ozone.data <- 
    read.csv("data/hadoop_ozone_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
hadoop.ozone.data$project_name <- "Hadoop Ozone"

incubator.iotdb.data <- 
    read.csv("data/incubator_iotdb_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
incubator.iotdb.data$project_name <- "IoTDB"

isis.data <- 
    read.csv("data/isis_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
isis.data$project_name <- "Isis (Agregator)"

jspwiki.data <- 
    read.csv("data/jspwiki_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
jspwiki.data$project_name <- "JSPWiki"

karaf.data <- 
    read.csv("data/karaf_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
karaf.data$project_name <- "Karaf"

pdfbox.data <- 
    read.csv("data/pdfbox_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
pdfbox.data$project_name <- "PDF Box"

poi.data <- 
    read.csv("data/poi_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
poi.data$project_name <- "POI"

servicecomb.data <- 
    read.csv("data/servicecomb_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
servicecomb.data$project_name <- "ServiceComb Pack"

servicecomb.toolkit.data <- 
    read.csv("data/servicecomb_toolkit_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
servicecomb.toolkit.data$project_name <- "ServiceComb Toolkit"

shiro.data <- 
    read.csv("data/shiro_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
shiro.data$project_name <- "Shiro"

slingcms.data <- 
    read.csv("data/slingcms_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
slingcms.data$project_name <- "Sling - CMS"

slingdist.data <- 
    read.csv("data/slingdist_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
slingdist.data$project_name <- "Sling Distribution Core"

slinglaunch.data <- 
    read.csv("data/slinglaunch_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
slinglaunch.data$project_name <- "Sling Launchpad Integration Tests"

slingresource.data <- 
    read.csv("data/slingresource_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
slingresource.data$project_name <- "Resource Resolver"

slingscripting.data <- 
    read.csv("data/slingscripting_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
slingscripting.data$project_name <- "Scripting JSP"

incubatorretired.data <- 
    read.csv("data/slingscripting_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
incubatorretired.data$project_name <- "Incubator Tamaya Extensions"

dolphin.data <- 
    read.csv("data/dolphin_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
dolphin.data$project_name <- "Dolphin Scheduler"

gateway.data <- 
    read.csv("data/gateway_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
gateway.data$project_name <- "Knox Gateway"

hop.data <- 
    read.csv("data/hop_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
hop.data$project_name <- "Hop Orchestration Platform"

jmeter.data <- 
    read.csv("data/jmeter_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
jmeter.data$project_name <- "JMeter"

openmeetings.data <- 
    read.csv("data/openmeetings_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
openmeetings.data$project_name <- "Openmeetings"

plc4x.data <- 
    read.csv("data/plc4x_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
plc4x.data$project_name <- "PLC4X"

roller.data <- 
    read.csv("data/roller_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
roller.data$project_name <- "Roller"

struts2.data <- 
    read.csv("data/struts2_survival_data.csv",
             header = TRUE,
             stringsAsFactors = FALSE,
             sep = ","
    )
struts2.data$project_name <- "Struts 2"

# data preparation - combing data

survival.analysis.data <-
    rbind(commons.compress.data,
          commons.geometry.data,
          cxf.data,
          groovy.data,
          hadoop.ozone.data,
          incubator.iotdb.data,
          isis.data,
          jspwiki.data,
          karaf.data,
          pdfbox.data,
          poi.data,
          servicecomb.data,
          servicecomb.toolkit.data,
          shiro.data,
          slingcms.data,
          slingdist.data,
          slinglaunch.data,
          slingresource.data,
          slingscripting.data,
          incubatorretired.data,
          dolphin.data,
          gateway.data,
          hop.data,
          jmeter.data,
          openmeetings.data,
          plc4x.data,
          roller.data,
          struts2.data
          )

# status binary
# 1 is CLOSED
# 0 is OPEN

survival.analysis.data$status_binary <-
    ifelse(survival.analysis.data$status == "OPEN", 0, 1)

survival.analysis.data.bugs <-
    survival.analysis.data %>%
    filter(type == "BUG")

survival.analysis.data.code.smells <-
    survival.analysis.data %>%
    filter(type == "CODE_SMELL")

survival.analysis.data.vulnerabilities <-
    survival.analysis.data %>%
    filter(type == "VULNERABILITY")

#-----------------------------------
# Data Analysis
#-----------------------------------

# descriptive statistics

# survived days - all
quantile(as.numeric(survival.analysis.data$survived_days))
mean(as.numeric(survival.analysis.data$survived_days))

# survived commits - all
quantile(as.numeric(survival.analysis.data$survived.commits))
mean(as.numeric(survival.analysis.data$survived.commits))

# survived days - bugs
quantile(as.numeric(survival.analysis.data.bugs$survived_days))
mean(as.numeric(survival.analysis.data.bugs$survived_days))

# survived commits - bugs
quantile(as.numeric(survival.analysis.data.bugs$survived.commits))
mean(as.numeric(survival.analysis.data.bugs$survived.commits))

# survived days - code smells
quantile(as.numeric(survival.analysis.data.code.smells$survived_days))
mean(as.numeric(survival.analysis.data.code.smells$survived_days))

# survived commits - code smells
quantile(as.numeric(survival.analysis.data.code.smells$survived.commits))
mean(as.numeric(survival.analysis.data.code.smells$survived.commits))

# survived days - vulnerabilities
quantile(as.numeric(survival.analysis.data.vulnerabilities$survived_days))
mean(as.numeric(survival.analysis.data.vulnerabilities$survived_days))

# survived commits - vulnerabilities
quantile(as.numeric(survival.analysis.data.vulnerabilities$survived.commits))
mean(as.numeric(survival.analysis.data.vulnerabilities$survived.commits))

# survival analysis

# days
surv.fit.model.days <- 
    survfit(data = survival.analysis.data,
            Surv(as.numeric(survived_days), status_binary) ~ type)

summary(surv.fit.model.days, 100)

surv.plot.days <- 
    ggsurvplot(surv.fit.model.days,  
               data = survival.analysis.data,
               conf.int = FALSE,
               pval = TRUE,
               fun = "pct",
               risk.table = TRUE,
               legend = "right") +
    xlab("Survived Days") 

surv.box.days <- 
    ggplot(survival.analysis.data,
           aes(x = type,
               y = as.numeric(survived_days))) +
    geom_boxplot() +
    scale_y_continuous(trans='log10') +
    labs(x = "All Code TDI",
         y = "Survived Days (Log Scale)") +
    theme(axis.text.x = element_text(angle = 90))

# commits
surv.fit.model.commits <- 
    survfit(data = survival.analysis.data,
            Surv(as.numeric(survived.commits), status_binary) ~ type)

summary(surv.fit.model.commits, 100)

surv.plot.commits <-
    ggsurvplot(surv.fit.model.commits,  
               data = survival.analysis.data,
               conf.int = FALSE,
               pval = TRUE,
               fun = "pct",
               risk.table = TRUE,
               legend = "right") +
    xlab("Survived Commits") 

surv.box.commits <-
    ggplot(survival.analysis.data,
           aes(x = type,
               y = as.numeric(survived.commits))) +
    geom_boxplot() +
    scale_y_continuous(trans='log10') +
    labs(x = "All Code TDI",
         y = "Survived Commits (Log Scale)") +
    theme(axis.text.x = element_text(angle = 90))

#-----------------------------------
# Box plots for individual systems
#-----------------------------------

surv.box.systems.days <- 
    ggplot(survival.analysis.data,
           aes(x = project_name,
               y = as.numeric(survived_days))) +
    geom_boxplot() +
    scale_y_continuous(trans='log10') +
    labs(x = "All Code TDI",
         y = "Survived Days (Log Scale)")+
    theme(axis.text.x = element_text(angle = 90))

surv.box.systems.commits <- 
    ggplot(survival.analysis.data,
           aes(x = project_name,
               y = as.numeric(survived.commits))) +
    geom_boxplot() +
    scale_y_continuous(trans='log10') +
    labs(x = "All Code TDI",
         y = "Survived Days (Log Scale)")+
    theme(axis.text.x = element_text(angle = 90))


