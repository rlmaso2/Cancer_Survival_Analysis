# scatter plot function:
scatterplot <- function(gene1, gene2, genenames, title, isave=F){
    if (isave){
        bmp(paste("scatter.",title, ".", genenames[1],".",genenames[2],".bmp",sep=""))
        par(mar=c(7.1, 6.1, 4.1, 2.1),cex.lab=1.6,cex.axis=1.6)
    }
    fit = lm(gene2 ~ gene1)
    vv = cor.test(gene1, gene2)	
    if (vv$p.value<0.001){
        pval = " P < 0.001"
    } else {
        pval = paste(" P = ", round(vv$p.value,digits=3), sep="")
    }
	
    # plain look: 
    plot(gene1, gene2, main = paste(round(vv$estimate,2), "(", round(vv$conf.int[1],2), ",", round(vv$conf.int[2],2),  ") (p-value = ", signif(vv$p.value,2), ")",sep=""), xlab=genenames[1], ylab=genenames[2])
	# nicer look:
#	plot(main=paste(pval,", r = ",round(vv$est,digits=2),sep=""), cex.main = 1.2, font.main = 2, PAWR, gene2, xlab=genenames[1], ylab=genenames[2], pch=20, col="red", cex.lab=1, font.lab = 1, cex.axis=1)

	# highlight box border
	box(lwd=2)
    if (isave){
        dev.off()
    }
}

## plot survival
survplot <- function(time0, event0, group0, gene0, label,title, isave=F){
    #library(survival)
    time = time0[group0!=0]; event = event0[group0!=0]; group = group0[group0!=0]
    fit = survfit(Surv(time, event) ~ as.factor(group))
    temp = survdiff(Surv(time, event) ~ as.factor(group))
    thispvalue = signif((1 - pchisq(temp$chisq, length(temp$n) - 1)), digits=3)
    ff = coxph(Surv(time0, event0) ~ gene0)
    print(summary(ff))
    coxpvalue = signif(summary(ff)$waldtest[3], digits=3)
    if (isave){ 
        bmp(paste(title,".bmp",sep=""))
    }
    par(mar=c(7.1, 6.1, 4.1, 2.1), cex.lab=1.6, cex.axis=1.6)
    plot(fit, col=c("black", "red"),main= paste(title,"\n( p-values = ",thispvalue," ,", coxpvalue, " )", sep=""), lwd=2, xlab="Time (Days or Months)", ylab="Alive or No Recurrence (%)")
    legend("bottomleft", label, lty=1,col=c("black", "red"),lwd=2,cex=.5)
    box(lwd=2)
    if (isave){
        dev.off()
    }
}
