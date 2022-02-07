function random(startNum, endNum) {
    const randomRange = endNum - startNum + 1;
    return Math.floor(Math.random() * randomRange) + startNum;
}

function getRandomJob() {
    const jobs = ["teacher", "doctor", "chef", "scientist", "firefighter", "postman", "artist", "developer", "nurse", "pilot", "judge", "waiter", "musician", "barber", "taxi driver", "pharmacist", "plumber", "architect", "surgeon", "detective", "reporter", "photographer", "sailor", "business man", "car mechanic", "astronaut", "baker"];
    return jobs[random(0, jobs.length - 1)];
}

function getRandomSalary() {
    return random(8, 25) * 1000;
}

module.exports = {
    random,
    getRandomJob,
    getRandomSalary
};
