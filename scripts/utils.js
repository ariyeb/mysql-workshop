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

function getUniqueRandomNumber(startNum, endNum, numbersSet) {
    const num = random(startNum, endNum);
    if (!numbersSet.has(num)) {
        numbersSet.add(num);
        return num;
    }
    return getUniqueRandomNumber(startNum, endNum, numbersSet);
}

function generateSetOf100UsersIds() {
    const idsSet = new Set();
    for (let i = 0; i < 100; i++)
        idsSet.add(random(1, 450));
    return idsSet;
}

function getRandomNumberThatDontExistInASet(startNum, endNum, numbersSet) {
    const num = random(startNum, endNum);
    if (!numbersSet.has(num)) return num;
    return getRandomNumberThatDontExistInASet(startNum, endNum, numbersSet);
}

const tags = [
    'customer', 'in', 'shine', 'helmet',
    'carry', 'nerve', 'misplace', 'interference',
    'television', 'movie', 'posture', 'truth',
    'ministry', 'switch', 'government', 'champion',
    'estate', 'insure', 'pie', 'abolish',
    'laborer', 'moment', 'doctor', 'notorious',
    'minimize', 'dozen', 'conventional', 'want',
    'valley', 'highlight', 'ivory', 'harmful',
    'shell', 'system', 'nationalism', 'ambition',
    'tile', 'settle', 'fox', 'have',
    'spill', 'swallow', 'arrange', 'resist',
    'emphasis', 'moon', 'fuel', 'abridge',
    'glass', 'friendly', 'instinct', 'float',
    'belt', 'referral', 'trust', 'disappointment',
    'index', 'rhythm', 'protect', 'exile',
    'kettle', 'main', 'bear', 'infinite',
    'entitlement', 'advertising', 'frog', 'glove',
    'manage', 'organize', 'necklace', 'fist',
    'supplementary', 'wine', 'pay', 'composer',
    'stool', 'classify', 'conglomerate', 'hair',
    'remain', 'implication', 'bacon', 'national',
    'cater', 'practical', 'pour', 'coast',
    'say', 'Europe', 'veteran', 'orchestra',
    'hut', 'nail', 'bush', 'rehearsal',
    'sea', 'raid', 'observation', 'elite'
];

function getTagsArray() {
    return tags;
}

function getUniqueRandomTagID(tagsArray) {
    const randomTagId = random(1, tags.length);
    if (!tagsArray.includes(randomTagId)) return randomTagId;
    return getUniqueRandomTagID(tagsArray);
}

function getPhotoTags() {
    const tagsCount = random(0, 6);
    if (tagsCount === 0) return null;
    const tags = [];
    for (let i = 0; i < tagsCount; i++) {
        tags.push(getUniqueRandomTagID(tags));
    }
    return tags;
}

function getUniqueLike(likes) {
    const like = random(1, 650);
    if (!likes.includes(like)) return like;
    return getUniqueLike(likes);
}

function getUserLikes() {
    const likesCount = random(0, 15);
    if (likesCount === 0) return null;
    const likes = [];
    for (let i = 0; i < likesCount; i++) {
        likes.push(getUniqueLike(likes));
    }
    return likes;
}

module.exports = {
    random,
    getRandomJob,
    getRandomSalary,
    getUniqueRandomNumber,
    generateSetOf100UsersIds,
    getRandomNumberThatDontExistInASet,
    getTagsArray,
    getPhotoTags,
    getUserLikes
};
