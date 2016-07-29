package ru.agentlab.maia.message.event;

import ru.agentlab.maia.agent.Event;
import ru.agentlab.maia.message.IMessage;

public class MessageRemovedEvent extends Event<IMessage> {

	public MessageRemovedEvent(IMessage message) {
		super(message);
	}

}
