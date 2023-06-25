#!/usr/bin/perl
use strict;
use warnings;

# Set up global variables
my $teaching_resources_directory = 'C:\\coding-initiative-teaching-resources';
my $website_directory = 'C:\\coding-initiative-websites';
my $app_directory = 'C:\\coding-initiative-apps';

# Set up the teaching resources directory
mkdir($teaching_resources_directory);

# Set up the local web server
system('C:\Python\python.exe -m http.server --directory C:\coding-initiative-teaching-resources');

# Set up the directories for websites and apps
mkdir($website_directory);
mkdir($app_directory);

# Define the HTML templates
my $website_template = <<'END';
<html>
<head>
	<title>{{title}}</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<h1>{{title}}</h1>
		
	<!--Add content here-->
	
</body>
</html>
END

my $app_template = <<'END';
<html>
<head>
	<title>{{title}}</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.5.16/p5.js"></script>
</head>
<body>
	<h1>{{title}}</h1>

	<!--Add content here-->

</body>
</html>
END

# Define the JavaScript templates
my $website_js_template = <<'END';
$(document).ready(function() {
	// Add JavaScript code here
});
END

my $app_js_template = <<'END';
function setup() {
	// Add p5.js code here
}

function draw() {
	// Add p5.js code here
}
END

# Create the teaching resources
my @resources = (
	{
		name => 'HTML Basics',
		type => 'html',
		file => $teaching_resources_directory.'/html-basics.html',
		content => '<h2>HTML Basics</h2>Add content here.'
	},
	{
		name => 'CSS Basics',
		type => 'html',
		file => $teaching_resources_directory.'/css-basics.html',
		content => '<h2>CSS Basics</h2>Add content here.'
	},
	{
		name => 'JavaScript Basics',
		type => 'html',
		file => $teaching_resources_directory.'/javascript-basics.html',
		content => '<h2>JavaScript Basics</h2>Add content here.'
	},
	{
		name => 'jQuery Basics',
		type => 'html',
		file => $teaching_resources_directory.'/jquery-basics.html',
		content => '<h2>jQuery Basics</h2>Add content here.'
	},
	{
		name => 'Introducing Projects',
		type => 'html',
		file => $teaching_resources_directory.'/introducing-projects.html',
		content => '<h2>Introducing Projects</h2>Add content here.'
	},
	{
		name => 'p5.js Basics',
		type => 'html',
		file => $teaching_resources_directory.'/p5.js-basics.html',
		content => '<h2>p5.js Basics</h2>Add content here.'
	},
	{
		name => 'website-template.html',
		type => 'html',
		file => $teaching_resources_directory.'/website-template.html',
		content => $website_template
	},
	{
		name => 'app-template.html',
		type => 'html',
		file => $teaching_resources_directory.'/app-template.html',
		content => $app_template
	},
	{
		name => 'website-template.js',
		type => 'js',
		file => $teaching_resources_directory.'/website-template.js',
		content => $website_js_template
	},
	{
		name => 'app-template.js',
		type => 'js',
		file => $teaching_resources_directory.'/app-template.js',
		content => $app_js_template
	}
);

# Create the files for the teaching resources
foreach my $resource (@resources) {
	open(my $fh, '>', $resource->{'file'}) or die "Could not open file '$resource->{'file'}' $!";
	print $fh $resource->{'content'};
	close $fh;
}

# Start the web server
system('C:\Python\python.exe -m http.server --directory C:\coding-initiative-teaching-resources');

# Invite interested youth to visit the local web server
print "Visit http://localhost:8000 to learn how to build websites and apps!";

# Provide assistance in setting up websites and apps
foreach my $project ($website_directory, $app_directory) {
	my $project_name = ($project eq $website_directory) ? 'website' : 'app';
	my $template_file = $teaching_resources_directory.'/'.$project_name.'-template.html';
	my $js_template_file = $teaching_resources_directory.'/'.$project_name.'-template.js';
	
	# Prompt the user for the name of the project
	print "Please enter the name of your $project_name: ";
	my $project_title = <STDIN>;
	chomp $project_title;
	
	# Create the project folder
	my $project_folder = $project.'/'.$project_title;
	mkdir($project_folder);
	
	# Create the HTML file
	my $html_file = $project_folder.'/index.html';
	open(my $fh, '>', $html_file) or die "Could not open file '$html_file' $!";
	my $html_content = $website_template;
	$html_content =~ s/\{\{title\}\}/$project_title/g;
	print $fh $html_content;
	close $fh;
	
	# Create the JavaScript file
	my $js_file = $project_folder.'/script.js';
	open(my $fh_js, '>', $js_file) or die "Could not open file '$js_file' $!";
	my $js_content = ($project_name eq 'website') ? $website_js_template : $app_js_template;
	print $fh_js $js_content;
	close $fh_js;
	
	# Print completion message
	print "Your $project_name has been created! You can find it in $project_folder\n";
}