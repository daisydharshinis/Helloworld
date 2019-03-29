


<sol:CodeView runat="server" ID="poda1" Mode="text/x-csharp" VirtualFilePath="~/Configuration/Samples/CodeTemplate/Sample_Csharp.cs" StartingLineOfFile="70" EndingLineOfFile="118" Theme="eclipse" Height="auto" AutoPostBack="false" ExcludeFromSumbission="true" />

DOT NET


{
	"title" : null,
  "content": [
    "This document describes how to perform Rate API calls for Solartis insure web services with ISO Electronic Rating Content (ERC) in .Net environment using C#."
  ],
	"sections" : [
		{
			"title":"Overview",
			"content":[
				"The .Net Framework has its own classes for performing HTTP requests. The System.Net namespace contains the HttpWebRequest and HttpWebResponse classes which can be used to fetch the data from web servers and HTTP based web services like SOAP/REST.",
				"Solartis Insure Rate APIs are RESTful APIs which returns data in either XML or JSON formats. It is easier to utilize XML since the .Net Framework has extensive support for reading and manipulating data in XML format. JSON is a text-based data-interchange format that produces compact payloads, which results in reduced bandwidth requirements when sending data."
			],
			"sections": null
		},
		{
			"title":"API Client Implementation",
			"content" : null,
			"sections": [
        {
          "title": "Solartis Insure ISO ERC APIs",
          "content": [
            "Solartis Insure Rate APIs for ISO Electronic Rating Content requires you to make authenticated POST requests. To make Rate API calls, we need to provide Content type and Authentication Token in the header and then write the request data into request body.",
            "The Solartis Insure Rate APIs for ISO ERC provides the following operations:  ",
            "Base URL ${baseUrl}"
          ],
          "sections": null
        },
				{
					"title" : "C# Code snippet to call Solartis Rate APIs",
          "content": [
            "The C# code snippet provided below uses sample JSON or XML request read from a file called “RequestTemplate.json” or “RequestTemplate.json” rather than constructing JSON or XML request object to make Rate API calls. During the real-time implementation, you may need to construct JSON or XML object as described in data dictionary provided.",
            "Also, the C# code snippet uses System.Net namespace contains the HttpWebRequest and HttpWebResponse classes to fetch the data from our HTTP based web services.During real-time implementation, you can use any third-party libraries like RESTSharp which is a lightweight .NET component that lets you easily consume REST web services",
            "The sample class is fragmented into different methods to betterment the code flow."
          ],
          "sections": [
            {
              "title": "The Main Method",
              "content": [
                "This is the main method where the execution begins. The static and non-static helper methods are invoked directly or using instance of the class. Prettification is optional and its is done only to pretty print the JSON or XML in the console.",
                "${CodeView:File:~/Configuration/Samples/CodeTemplate/Sample_Csharp.cs:21:68}"
              ],
              "sections": null
            },
            {
              "title": "POST data to the server",
              "content": [
                "This method takes in the Service URL and the Request JSON or XML to produce the Response JSON or XML as a String. Here, TLS connection to the virtual servers are disabled to avoid exceptions.",
                "${CodeView:File:~/Configuration/Samples/CodeTemplate/Sample_Csharp.cs:70:118}"
              ],
              "sections": null
            },
            {
              "title": "Format JSON",
              "content": [
                "This is an optional method and It is used only to pretty print the JSON in the console.",
                "${CodeView:File:~/Configuration/Samples/CodeTemplate/Sample_Csharp.cs:120:180}"
              ],
              "sections": null
            },
            {
              "title": "Format XML",
              "content": [
                "This is an optional method and It is used only to pretty print the XML in the console.",
                "${CodeView:File:~/Configuration/Samples/CodeTemplate/Sample_Csharp.cs:182:209}"
              ],
              "sections": null
            }
          ]
				}
			]
		}
	]
}