/*****

Copyright (c) 2016, Jerome Lepage (j@cfm.io)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

****/
component extends='cffwktest.elements.AbstractElement' accessors=true output=true persistent=false {

	public any function run(required any args) {

		var basePath = getDirectoryFromPath(getBaseTemplatePath());
		var file = basePath & replace(arguments.args.filename, '.', getConfig().getFileSeparator(), 'all');

		if (fileExists(file)) {
			return arguments.args;
		}

		if (fileExists(file & '.cfc')) {
			return arguments.args;
		}

		if (fileExists(file & '.cfm')) {
			return arguments.args;
		}

		fail('CFML File ' & file & ' not found');
		return arguments.args;

	}


}