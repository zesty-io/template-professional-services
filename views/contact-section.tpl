<!-- Four -->
<section id="contact" class="wrapper style4 special">
   <div class="container 75%">
      <header class="major">
         {{if {post_var.email} }}
         <h1> Thanks for contacting us! We will be in touch.</h1>
         {{else}}
         <h2>Contact Us<br />
            We are ready to work with you
         </h2>
      </header>
      <form id="fupForm" method="post" action="#" >
         <input type="hidden" name="_next" value="#">
         <!-- These values control how Zesty understands the form. -->
         <input name="zlf" value="Form Request" type="hidden">
         <input name="zcf" value="1" type="hidden">  
         <input type="hidden" name="_template" value="table">
         <input type="hidden" name="_captcha" value="false">
         <input type="hidden" name="{{setting.contact-form.honeypot}}" value="">
         <div class="row uniform 50%">
            <div class="6u 12u(mobilep)"><input type="text" name="name" id="name" placeholder="Name" required/></div>
            <div class="6u 12u(mobilep)"><input type="email" name="email" id="email" placeholder="Email" required/></div>
         </div>
         <div class="row uniform 50%">
            <div class="12u"><textarea name="message" id="message" placeholder="Message" rows="8" required></textarea></div>
         </div>
         <div class="row uniform">
            <div class="12u">
               <ul class="actions">
                  <li><input type="submit" value="Send Message" /></li>
               </ul>
            </div>
         </div>
      </form>
      <h1 id="msg" style="display:none">Thank you!</h1>
      {{end-if}}
   </div>
</section>
<script type="text/javascript">
    $("#fupForm").on("submit", function (e) {
       e.preventDefault();
       var form = $(this);
      var url = '#';
       $.ajax({
         type: "POST",
         url: url,
         data: $(form).serialize(), // serializes the form's elements.
         success: function(data)
         {
         $(form).unbind('submit');
               $.ajax({
                  method: 'POST',
                  url: 'https://formsubmit.co/{{setting.contact-form.sending_email}}',
                  dataType: 'json',
                  accepts: 'application/json',
                  data: $(form).serialize(),
                  success: $(form).replaceWith( "<div><h1>Thank you for contacting us! We will be in touch.</h1> </div>" ),
                  error: $(form).replaceWith( "<div><h1>There was an error submitting this form. Please refresh the page and try again.</h1> </div>" )
                  });
         ///
         }
      });
      ///

    });



</script>