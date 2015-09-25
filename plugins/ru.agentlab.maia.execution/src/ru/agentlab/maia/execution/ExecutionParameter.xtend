package ru.agentlab.maia.execution

import java.util.concurrent.atomic.AtomicReference
import org.eclipse.xtend.lib.annotations.Accessors

class ExecutionParameter<T> implements IExecutionParameter<T> {

	@Accessors
	val protected String name

	@Accessors
	val protected Class<T> type

	val protected reference = new AtomicReference<AtomicReference<T>>

	@Accessors
	val protected boolean isOptional

	new(String name, Class<T> type, boolean isOptional) {
		this.name = name
		this.type = type
		this.isOptional = isOptional
	}

	new(String name, Class<T> type) {
		this(name, type, false)
	}

	override setValue(T v) {
		reference.get.set(v)
	}

	override getValue() {
		reference.get.get
	}

	override getReference() {
		return reference.get
	}

	override link(IExecutionParameter<T> param) {
		reference.set(param.reference)
	}

	override unlink() {
		reference.set(new AtomicReference<T>(null))
	}

}