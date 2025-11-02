<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.UserProfile" %>
<%
    UserProfile user = (UserProfile) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - AI Internship Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-50">
    <!-- Navigation -->
    <nav class="bg-white shadow-md">
        <div class="container mx-auto px-6 py-4">
            <div class="flex items-center justify-between">
                <div class="flex items-center space-x-4">
                    <i class="fas fa-brain text-blue-600 text-2xl"></i>
                    <span class="text-xl font-bold text-gray-800">AI Internship Portal</span>
                </div>
                
                <div class="hidden md:flex space-x-6">
                    <a href="home.jsp" class="text-blue-600 font-semibold">Dashboard</a>
                    <a href="recommendations.jsp" class="text-gray-600 hover:text-blue-600 transition">Recommendations</a>
                    <a href="profile.jsp" class="text-gray-600 hover:text-blue-600 transition">My Profile</a>
                    <a href="applications.jsp" class="text-gray-600 hover:text-blue-600 transition">Applications</a>
                </div>

                <div class="flex items-center space-x-4">
                    <button class="relative">
                        <i class="fas fa-bell text-gray-600 text-xl"></i>
                        <span class="absolute -top-1 -right-1 bg-red-500 text-white text-xs rounded-full w-4 h-4 flex items-center justify-center">3</span>
                    </button>
                    <div class="relative group">
                        <button class="flex items-center space-x-2">
                            <img src="https://ui-avatars.com/api/?name=<%= user.getName() %>&background=4F46E5&color=fff" class="w-10 h-10 rounded-full">
                            <i class="fas fa-chevron-down text-gray-600"></i>
                        </button>
                        <div class="absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg py-2 hidden group-hover:block">
                            <a href="profile.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">
                                <i class="fas fa-user mr-2"></i>My Profile
                            </a>
                            <a href="settings.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">
                                <i class="fas fa-cog mr-2"></i>Settings
                            </a>
                            <hr class="my-2">
                            <a href="LogoutServlet" class="block px-4 py-2 text-red-600 hover:bg-gray-100">
                                <i class="fas fa-sign-out-alt mr-2"></i>Logout
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mx-auto px-6 py-8">
        <!-- Welcome Section -->
        <div class="mb-8">
            <h1 class="text-3xl font-bold text-gray-900 mb-2">
                Welcome back, <%= user.getName() %>! 👋
            </h1>
            <p class="text-gray-600">Here's what's happening with your internship search today</p>
        </div>

        <!-- Stats Cards -->
        <div class="grid md:grid-cols-4 gap-6 mb-8">
            <div class="bg-white rounded-xl shadow-md p-6 border-l-4 border-blue-500">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-500 text-sm mb-1">New Matches</p>
                        <h3 class="text-3xl font-bold text-gray-900">12</h3>
                    </div>
                    <div class="bg-blue-100 rounded-full p-3">
                        <i class="fas fa-briefcase text-blue-600 text-xl"></i>
                    </div>
                </div>
                <p class="text-green-600 text-sm mt-2">
                    <i class="fas fa-arrow-up mr-1"></i>8% from last week
                </p>
            </div>

            <div class="bg-white rounded-xl shadow-md p-6 border-l-4 border-purple-500">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-500 text-sm mb-1">Applications</p>
                        <h3 class="text-3xl font-bold text-gray-900">7</h3>
                    </div>
                    <div class="bg-purple-100 rounded-full p-3">
                        <i class="fas fa-paper-plane text-purple-600 text-xl"></i>
                    </div>
                </div>
                <p class="text-gray-600 text-sm mt-2">3 pending review</p>
            </div>

            <div class="bg-white rounded-xl shadow-md p-6 border-l-4 border-green-500">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-500 text-sm mb-1">Profile Views</p>
                        <h3 class="text-3xl font-bold text-gray-900">34</h3>
                    </div>
                    <div class="bg-green-100 rounded-full p-3">
                        <i class="fas fa-eye text-green-600 text-xl"></i>
                    </div>
                </div>
                <p class="text-green-600 text-sm mt-2">
                    <i class="fas fa-arrow-up mr-1"></i>15% increase
                </p>
            </div>

            <div class="bg-white rounded-xl shadow-md p-6 border-l-4 border-orange-500">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-500 text-sm mb-1">Match Score</p>
                        <h3 class="text-3xl font-bold text-gray-900">87%</h3>
                    </div>
                    <div class="bg-orange-100 rounded-full p-3">
                        <i class="fas fa-chart-line text-orange-600 text-xl"></i>
                    </div>
                </div>
                <p class="text-gray-600 text-sm mt-2">Excellent profile</p>
            </div>
        </div>

        <div class="grid md:grid-cols-3 gap-6">
            <!-- Main Content -->
            <div class="md:col-span-2 space-y-6">
                <!-- Top Matches -->
                <div class="bg-white rounded-xl shadow-md p-6">
                    <div class="flex items-center justify-between mb-6">
                        <h2 class="text-xl font-bold text-gray-900">
                            <i class="fas fa-star text-yellow-500 mr-2"></i>Top Matches For You
                        </h2>
                        <a href="recommendations.jsp" class="text-blue-600 hover:text-blue-700 font-semibold text-sm">
                            View All <i class="fas fa-arrow-right ml-1"></i>
                        </a>
                    </div>

                    <!-- Match Card 1 -->
                    <div class="border border-gray-200 rounded-lg p-4 mb-4 hover:shadow-md transition">
                        <div class="flex items-start justify-between mb-3">
                            <div class="flex items-start space-x-3">
                                <img src="https://logo.clearbit.com/google.com" class="w-12 h-12 rounded-lg" onerror="this.src='https://ui-avatars.com/api/?name=G&background=4285F4&color=fff'">
                                <div>
                                    <h3 class="font-bold text-gray-900">Software Engineering Intern</h3>
                                    <p class="text-gray-600 text-sm">Google • Mountain View, CA</p>
                                </div>
                            </div>
                            <span class="bg-green-100 text-green-700 px-3 py-1 rounded-full text-sm font-semibold">95% Match</span>
                        </div>
                        <p class="text-gray-600 text-sm mb-3">Build innovative features for millions of users. Work with cutting-edge technologies...</p>
                        <div class="flex items-center justify-between">
                            <div class="flex flex-wrap gap-2">
                                <span class="bg-blue-100 text-blue-700 px-2 py-1 rounded text-xs">Python</span>
                                <span class="bg-blue-100 text-blue-700 px-2 py-1 rounded text-xs">Java</span>
                                <span class="bg-blue-100 text-blue-700 px-2 py-1 rounded text-xs">ML</span>
                            </div>
                            <button class="bg-blue-600 text-white px-4 py-2 rounded-lg text-sm font-semibold hover:bg-blue-700 transition">
                                Apply Now
                            </button>
                        </div>
                    </div>

                    <!-- Match Card 2 -->
                    <div class="border border-gray-200 rounded-lg p-4 mb-4 hover:shadow-md transition">
                        <div class="flex items-start justify-between mb-3">
                            <div class="flex items-start space-x-3">
                                <img src="https://logo.clearbit.com/microsoft.com" class="w-12 h-12 rounded-lg" onerror="this.src='https://ui-avatars.com/api/?name=M&background=00A4EF&color=fff'">
                                <div>
                                    <h3 class="font-bold text-gray-900">AI Research Intern</h3>
                                    <p class="text-gray-600 text-sm">Microsoft • Redmond, WA</p>
                                </div>
                            </div>
                            <span class="bg-green-100 text-green-700 px-3 py-1 rounded-full text-sm font-semibold">92% Match</span>
                        </div>
                        <p class="text-gray-600 text-sm mb-3">Join our AI research team working on next-generation language models and computer vision...</p>
                        <div class="flex items-center justify-between">
                            <div class="flex flex-wrap gap-2">
                                <span class="bg-purple-100 text-purple-700 px-2 py-1 rounded text-xs">AI/ML</span>
                                <span class="bg-purple-100 text-purple-700 px-2 py-1 rounded text-xs">PyTorch</span>
                                <span class="bg-purple-100 text-purple-700 px-2 py-1 rounded text-xs">Research</span>
                            </div>
                            <button class="bg-blue-600 text-white px-4 py-2 rounded-lg text-sm font-semibold hover:bg-blue-700 transition">
                                Apply Now
                            </button>
                        </div>
                    </div>

                    <!-- Match Card 3 -->
                    <div class="border border-gray-200 rounded-lg p-4 hover:shadow-md transition">
                        <div class="flex items-start justify-between mb-3">
                            <div class="flex items-start space-x-3">
                                <img src="https://logo.clearbit.com/amazon.com" class="w-12 h-12 rounded-lg" onerror="this.src='https://ui-avatars.com/api/?name=A&background=FF9900&color=fff'">
                                <div>
                                    <h3 class="font-bold text-gray-900">Data Science Intern</h3>
                                    <p class="text-gray-600 text-sm">Amazon • Seattle, WA</p>
                                </div>
                            </div>
                            <span class="bg-yellow-100 text-yellow-700 px-3 py-1 rounded-full text-sm font-semibold">88% Match</span>
                        </div>
                        <p class="text-gray-600 text-sm mb-3">Analyze large-scale data to derive actionable insights that drive business decisions...</p>
                        <div class="flex items-center justify-between">
                            <div class="flex flex-wrap gap-2">
                                <span class="bg-green-100 text-green-700 px-2 py-1 rounded text-xs">Data Science</span>
                                <span class="bg-green-100 text-green-700 px-2 py-1 rounded text-xs">SQL</span>
                                <span class="bg-green-100 text-green-700 px-2 py-1 rounded text-xs">Analytics</span>
                            </div>
                            <button class="bg-blue-600 text-white px-4 py-2 rounded-lg text-sm font-semibold hover:bg-blue-700 transition">
                                Apply Now
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Recent Activity -->
                <div class="bg-white rounded-xl shadow-md p-6">
                    <h2 class="text-xl font-bold text-gray-900 mb-6">
                        <i class="fas fa-clock text-blue-600 mr-2"></i>Recent Activity
                    </h2>
                    <div class="space-y-4">
                        <div class="flex items-center space-x-4">
                            <div class="bg-green-100 rounded-full p-2 w-10 h-10 flex items-center justify-center">
                                <i class="fas fa-check text-green-600"></i>
                            </div>
                            <div class="flex-1">
                                <p class="font-semibold text-gray-900">Application submitted</p>
                                <p class="text-gray-600 text-sm">Frontend Developer at Spotify • 2 hours ago</p>
                            </div>
                        </div>
                        <div class="flex items-center space-x-4">
                            <div class="bg-blue-100 rounded-full p-2 w-10 h-10 flex items-center justify-center">
                                <i class="fas fa-eye text-blue-600"></i>
                            </div>
                            <div class="flex-1">
                                <p class="font-semibold text-gray-900">Profile viewed</p>
                                <p class="text-gray-600 text-sm">TechCorp HR Manager • 5 hours ago</p>
                            </div>
                        </div>
                        <div class="flex items-center space-x-4">
                            <div class="bg-purple-100 rounded-full p-2 w-10 h-10 flex items-center justify-center">
                                <i class="fas fa-star text-purple-600"></i>
                            </div>
                            <div class="flex-1">
                                <p class="font-semibold text-gray-900">New match found</p>
                                <p class="text-gray-600 text-sm">ML Engineer at OpenAI • 1 day ago</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sidebar -->
            <div class="space-y-6">
                <!-- Profile Completion -->
                <div class="bg-white rounded-xl shadow-md p-6">
                    <h3 class="font-bold text-gray-900 mb-4">Profile Strength</h3>
                    <div class="mb-4">
                        <div class="flex items-center justify-between mb-2">
                            <span class="text-gray-600">Completion</span>
                            <span class="font-bold text-blue-600">85%</span>
                        </div>
                        <div class="w-full bg-gray-200 rounded-full h-2">
                            <div class="bg-gradient-to-r from-blue-600 to-purple-600 h-2 rounded-full" style="width: 85%"></div>
                        </div>
                    </div>
                    <div class="space-y-3">
                        <div class="flex items-center text-sm">
                            <i class="fas fa-check-circle text-green-500 mr-2"></i>
                            <span class="text-gray-600">Basic information added</span>
                        </div>
                        <div class="flex items-center text-sm">
                            <i class="fas fa-check-circle text-green-500 mr-2"></i>
                            <span class="text-gray-600">Skills & interests added</span>
                        </div>
                        <div class="flex items-center text-sm">
                            <i class="fas fa-circle text-gray-300 mr-2"></i>
                            <span class="text-gray-600">Add resume</span>
                        </div>
                    </div>
                    <button class="w-full mt-4 bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700 transition">
                        Complete Profile
                    </button>
                </div>

                <!-- Quick Actions -->
                <div class="bg-white rounded-xl shadow-md p-6">
                    <h3 class="font-bold text-gray-900 mb-4">Quick Actions</h3>
                    <div class="space-y-3">
                        <button class="w-full flex items-center justify-between px-4 py-3 bg-gradient-to-r from-blue-50 to-purple-50 rounded-lg hover:shadow-md transition">
                            <span class="flex items-center">
                                <i class="fas fa-search text-blue-600 mr-3"></i>
                                <span class="font-semibold text-gray-700">Find More Matches</span>
                            </span>
                            <i class="fas fa-arrow-right text-gray-400"></i>
                        </button>
                        <button class="w-full flex items-center justify-between px-4 py-3 bg-gradient-to-r from-green-50 to-blue-50 rounded-lg hover:shadow-md transition">
                            <span class="flex items-center">
                                <i class="fas fa-upload text-green-600 mr-3"></i>
                                <span class="font-semibold text-gray-700">Upload Resume</span>
                            </span>
                            <i class="fas fa-arrow-right text-gray-400"></i>
                        </button>
                        <button class="w-full flex items-center justify-between px-4 py-3 bg-gradient-to-r from-purple-50 to-pink-50 rounded-lg hover:shadow-md transition">
                            <span class="flex items-center">
                                <i class="fas fa-edit text-purple-600 mr-3"></i>
                                <span class="font-semibold text-gray-700">Edit Preferences</span>
                            </span>
                            <i class="fas fa-arrow-right text-gray-400"></i>
                        </button>
                    </div>
                </div>

                <!-- Tips -->
                <div class="bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl shadow-md p-6 text-white">
                    <div class="flex items-center mb-3">
                        <i class="fas fa-lightbulb text-yellow-300 text-2xl mr-3"></i>
                        <h3 class="font-bold text-lg">Pro Tip</h3>
                    </div>
                    <p class="text-sm text-blue-50">
                        Complete your profile to increase your match score by up to 30%! Companies are 3x more likely to view complete profiles.
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>