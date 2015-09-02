package ru.agentlab.maia.execution.scheduler.pattern.impl

import org.eclipse.xtend.lib.annotations.AccessorType
import org.eclipse.xtend.lib.annotations.Accessors

import static extension org.eclipse.xtend.lib.annotations.AccessorType.*

@Accessors(AccessorType.PUBLIC_GETTER)
class StatusPatternTransition extends AbstractPatternTransition {

	int status

	new(int status, String name, PatternState fromState, PatternState toState) {
		super(name, fromState, toState)
		this.status = status
	}

}