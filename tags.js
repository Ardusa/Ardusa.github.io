const tags = [
    {
        name: 'Java',
        color: 'red',
        className: 'tag-red'
    },
    {
        name: 'Python',
        color: 'yellow',
        className: 'tag-yellow'
    },
    {
        name: 'Computer Vision',
        color: 'blue',
        className: 'tag-blue'
    },
    {
        name: 'React',
        color: 'green',
        className: 'tag-green'
    },
    {
        name: 'Project Management',
        color: 'pink',
        className: 'tag-pink'
    }
    ,
    {
        name: 'JavaScript',
        color: 'orange',
        className: 'tag-orange'
    },
    {
        name: 'HTML',
        color: 'cyan',
        className: 'tag-cyan'
    },
    {
        name: 'WebSockets',
        color: 'purple',
        className: 'tag-purple'
    },
    {
        name: 'AI',
        color: 'brown',
        className: 'tag-brown'
    },
    {
        name: 'SQL',
        color: 'dark-green',
        className: 'tag-dark-green'
    }
];

function createTag(tag) {
    const tagElement = document.createElement('span');
    tagElement.className = tag.className;
    tagElement.innerText = tag.name;
    return tagElement;
}

function appendTagsToContainer(containerId) {
    const container = document.getElementById(containerId);
    if (!container) return;

    tags.forEach(tag => {
        const tagElement = createTag(tag);
        container.appendChild(tagElement);
    });
}

// Example usage:
// appendTagsToContainer('tags-container');