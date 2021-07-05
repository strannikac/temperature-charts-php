# Temperature Charts

This is SPA project. It shows 2 charts: chart of temperatures for one location and chart of temperatures for all locations.\
Also can select period for charts.

## Implementation

App directory contains App.php (app starts here), request, all controllers with logic, response. 
Model directory contains models (work with database tables). 
Helper and Service directories help project (for example, database class for work with database). 
Html directory is directory for all templates (html, css, javascript).

## Requirements

 - PHP 7
 - mariadb (or mysql) database
 - SSL (HTTPS)

## Running/Installation

- Get project and move files on server.
- Create database from file db.sql (in root of project).
- Run project in browser from project folder on server.

## Settings

Change some constants in config.php (in root of project). For example, data for database connection, domain name and other.

Change some variables in App/Request.php (if needed). For example, firstUriItem variable - by default 0, it means that project is in root of domain (https://domain.com), 1 means that project is in folder of domain (https://domain.com/project_folder/).