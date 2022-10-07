<!-- Main-->
				<div class="wrapper style2">
					<section id="main" class="container">
						<header class="major">
							<h2>{{this.title}}</h2>
							<p>Written By: <a href="{{authors.filter(z.zuid = '{this.written_by}').getUrl()}}">{{authors.filter(z.zuid = '{this.written_by}').name}}</a></p>
						</header>
						<div class="row 150%">
							<div class="8u 12u(narrow)">

								<!-- Content -->
									<section id="content">
										<div class="image"><img src="{{this.main_image.getImage()}}" alt="" /></div>
										{{this.content}}
									</section>
									<ul class="stats">
										{{each categories as tags where find_in_set(z.zuid,'{this.tags}')}}
										<li><a href="{{category.getUrl()}}" class="icon fa-tag" title="">{{category.name}}</a></li>
										{{end-each}}
												</ul>
							</div>
							<div class="4u 12u(narrow)">

								<!-- Sidebar -->
									<section id="sidebar">
										<h3>Tags</h3>
										{{each categories as category where find_in_set(z.zuid,'{this.tags}')}}
										<a style="margin-right:10px" href="{{category.getUrl()}}" class="icon fa-tag" title="">{{category.name}}</a>
										{{end-each}}

										<hr />
										<h3> Latest Articles</h3>
										{{each articles as latest where z.zuid != '{this.zuid}' limit 3 }}
										<div class="card grow">
											<a href="#" class="image fit"><img src="{{latest.main_image.getImage()}}?crop=421,316" alt="" /></a>
												<h3>{{latest.title}}</h3>
												{{latest.content.subwords(20)}}...
												<footer>
													<ul class="actions">
														<li><a href="{{lsatest.getUrl()}}" class="button small alt">Read More</a></li>
													</ul>
												</footer>
											</a>
											</div>
									{{end-each}}
							</div>
						</div>
					</section>
				</div>