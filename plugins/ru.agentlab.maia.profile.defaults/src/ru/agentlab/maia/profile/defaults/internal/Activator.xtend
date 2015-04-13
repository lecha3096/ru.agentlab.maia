package ru.agentlab.maia.profile.defaults.internal

import org.osgi.framework.BundleActivator
import org.osgi.framework.BundleContext
import ru.agentlab.maia.agent.AgentFactory
import ru.agentlab.maia.agent.MaiaAgentProfile
import ru.agentlab.maia.container.MaiaContainerProfile
import ru.agentlab.maia.context.IMaiaContext
import ru.agentlab.maia.context.naming.IMaiaContextNameFactory
import ru.agentlab.maia.naming.uuid.UuidNameGenerator

class Activator implements BundleActivator {

	static BundleContext context

	def static BundleContext getContext() {
		return context
	}

	override start(BundleContext context) throws Exception {
		Activator.context = context
		val containerProfile = new MaiaContainerProfile => [
			putImplementation(IMaiaContextNameFactory, UuidNameGenerator)
			putFactory(IMaiaContext, AgentFactory)
		]
		val agentProfile = new MaiaAgentProfile => [
			putImplementation(IMaiaContextNameFactory, UuidNameGenerator)
		]
		context => [
			registerService(MaiaContainerProfile, containerProfile, null)
			registerService(MaiaAgentProfile, agentProfile, null)
		]
	}

	override stop(BundleContext context) throws Exception {
		Activator.context = null
	}

}