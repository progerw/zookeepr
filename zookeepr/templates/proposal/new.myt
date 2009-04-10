<&| @zookeepr.lib.form:fill, defaults=defaults, errors=errors &>
<h2>Propose a talk or tutorial</h2>
<p>Please read the <a href="<% h.url_for("/programme/presenter_faq") %>">Presenter FAQ</a> before submitting a proposal.</p>

% if len(errors)>0:
<p class="error-message">Not submitted, sorry &mdash; there was a problem.
<br />Please see below for more details, edit and resubmit.</p>
%   for k in errors:
%     if errors[k] in ('Please enter a value', 'Missing value'):
%       errors[k]='This information is required.'
%     #endif
%   #endif
% #endif

<% h.form(h.url(), multipart=True) %>
<& form.myt &>

  <p class="submit"><% h.submitbutton('Submit!') %></p>
<% h.end_form() %>
</&>

<%method title>
Call for Presentations - <& PARENT:title &>
</%method>

<%args>
defaults
errors
</%args>

<%init>
# Working around a bug in formencode, we need to set the defaults to the c.proposal
# values
if not defaults:
    defaults = {
        'proposal.type': 1,
        'proposal.accommodation_assistance': 0,
        'proposal.travel_assistance': 0,
    }
    if c.signed_in_person:
        c.person = c.signed_in_person
        defaults['person.mobile'] = c.person.mobile
        defaults['person.experience'] = c.person.experience
        defaults['person.bio'] = c.person.bio
</%init>
