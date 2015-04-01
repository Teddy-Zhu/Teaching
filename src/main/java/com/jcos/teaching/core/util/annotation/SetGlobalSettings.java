package com.jcos.teaching.core.util.annotation;

import java.lang.annotation.*;

@Documented
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface SetGlobalSettings {
	String[] value() default {};
}
