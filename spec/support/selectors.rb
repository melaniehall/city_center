def idsf(descriptor_text)
  selector = sf(descriptor_text)

  if selector.start_with? '#'
    selector[1..-1]
  else
    selector
  end
end

def sf(descriptor_text)#selector for
  case descriptor_text
  when /the sign in button/
    '#sign_in_link'
  when /the sign up button/
    '#sign_up_link'
  when /the sign out button/
    '#sign_out_link'
  when /add event/
    '#add_event_to_organization1'
  end
end

