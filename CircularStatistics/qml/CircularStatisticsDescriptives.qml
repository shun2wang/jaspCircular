//
// Copyright (C) 2019 Aaron Bahde, University of Tuebingen
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public
// License along with this program.  If not, see
// <http://www.gnu.org/licenses/>.
//

import QtQuick 2.8
import QtQuick.Layouts 1.3
import JASP.Controls 1.0
import JASP.Theme 1.0

// All Analysis forms must be built with the From QML item
Form 
{
	usesJaspResults: true
	
	VariablesForm 
	{
        AvailableVariablesList { name: "allVariablesList" }
        AssignedVariablesList { name: "variables";	title: qsTr("Variables"); allowedColumns: ["scale"] }
		AssignedVariablesList { name: "splitby";	title: qsTr("Split"); singleVariable: true; allowedColumns: ["ordinal", "nominal"] }
	}

    RadioButtonGroup
    {
        name: "periodGroup"
        title: qsTr("Period")
        RadioButton { value: "pi";	label: qsTr("Pi")	}
        RadioButton { value: "pi_2";	label: qsTr("2Pi")	}
        RadioButton
        {
            value: "custom";	label: qsTr("Custom:"); checked: true
            childrenOnSameRow: true
            DoubleField { name: "period"; defaultValue: 360; fieldWidth: 70; max: 999999; min: 0.00001}
        }
    }
	
	ExpanderButton 
	{
		title: qsTr("Plots")
        Group
        {
            CheckBox { name: "plotVariables"; label: qsTr("Distribution plots"); id: plotVariables }
            CheckBox { name: "plotStacking"; label: qsTr("Stack points"); enabled: plotVariables.checked; indent: true	}
            CheckBox { name: "plotMean"; label: qsTr("Display mean vector")	; enabled: plotVariables.checked; indent: true}
            CheckBox { name: "plotHistogram"; label: qsTr("Display histogram"); enabled: plotVariables.checked; indent: true}
        }
    }

	
	ExpanderButton 
	{
		title: qsTr("Statistics")
		
		GridLayout 
		{	
			GroupBox 
			{
				title: qsTr("Central Tendency")
                CheckBox { name: "meanDirection";			text: qsTr("Mean direction");		checked: true	}
                CheckBox { name: "meanLength";			text: qsTr("Mean resultant length");}
                CheckBox { name: "median";			text: qsTr("Median");				}
            }
			
			GroupBox 
			{
				title: qsTr("Dispersion")
				CheckBox { name: "standardDeviation";	text: qsTr("Std.deviation"); checked: true	}
                CheckBox { name: "variance";			text: qsTr("Variance")						}
				CheckBox { name: "range";				text: qsTr("Range")							}
            }
		}		
	}
}
