package com.example.demo.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LogAspect {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Pointcut("execution(* com.example.demo..*.*(..))")
    public void LogPointCut() {
    }

    @Before("LogPointCut()")
    public void beforeMethod(JoinPoint joinPoint) {
        logger.info("User Access");
        logger.info("execute for{}", joinPoint);
    }

    @After("LogPointCut()")
    private void afterMethod(JoinPoint joinPoint) {
        logger.info(joinPoint.getSignature().getName());
    }

    @AfterReturning(value = "LogPointCut()", returning = "result")
    private void afterReturnningMethod(JoinPoint joinPoint, Object result) {
        String methodName = joinPoint.getSignature().getName();
        logger.info(methodName + " Result= " + result);
    }

    @AfterThrowing(pointcut = "LogPointCut()", throwing = "e")
    private void afterThrowingMethod(JoinPoint joinPoint, Exception e) {
        logger.error(e.getMessage());
    }
}