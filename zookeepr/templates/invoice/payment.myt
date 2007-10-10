<h1>Pay invoice</h1>

<form method="POST"
  action="https://vault.safepay.com.au/cgi-bin/test_payment.pl"
  onSubmit="return disableForm(this);" >

# % for k in fields.keys():
# <input type="hidden" name="<% k %>" value="<% fields[k] %>">
# % # end for

<input type="hidden" name="Invoice <% fields['InvoiceID'] %>"
  VALUE="<% "%.2f" % (fields['Amount']/100.0) %>">

<p>
<strong>Invoice #:</strong>
<% fields['InvoiceID'] %>
</p>

<p>
<strong>Amount:</strong>
<% h.number_to_currency(fields['Amount']/100.0) %>
</p>

<p>
View <% h.link_to('invoice details', url=h.url(action='view')) %> or <%
h.link_to('registration status', url='/registration/status') %> before
payment.
</p>

<input type="hidden" name="receipt_address"
  value="<% c.invoice.person.email_address |h %>">

<input type="hidden" name="invoice_id" value="<% fields['InvoiceID'] %>">
<input type="hidden" name="hidden_fields" value="invoice_id">
<input type="hidden" name="information_fields" value="invoice_id">

<INPUT TYPE="HIDDEN" NAME="vendor_name" VALUE="linux">
<input type="hidden" name="reply_link_url"
  value="http://www.baum.com.au/mel8/payment/new?invoice_id=&payment_amount=&bank_reference=&payment_number=">
<input type="hidden" name="return_link_url"
  value="http://www.baum.com.au:5000/registration/status">

<input type="submit" value="Go to the SecurePay checkout">
</form>

<%args>
fields
</%args>
