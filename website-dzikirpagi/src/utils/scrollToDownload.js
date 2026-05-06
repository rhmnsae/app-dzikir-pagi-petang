const sectionIds = ['features', 'preview', 'support', 'download'];

const cleanHash = () => {
  const hashId = window.location.hash.slice(1);
  if (!sectionIds.includes(hashId)) return hashId;

  window.history.replaceState(
    null,
    '',
    `${window.location.pathname}${window.location.search}`,
  );

  return hashId;
};

export const scrollToSection = (sectionId, event, behavior = 'smooth') => {
  event?.preventDefault();
  cleanHash();
  document.getElementById(sectionId)?.scrollIntoView({
    behavior,
    block: 'start',
  });
};

export const scrollToFeatures = (event) => scrollToSection('features', event);
export const scrollToPreview = (event) => scrollToSection('preview', event);
export const scrollToSupport = (event) => scrollToSection('support', event);
export const scrollToDownload = (event) => scrollToSection('download', event);

export const cleanSectionHashOnLoad = () => {
  const sectionId = cleanHash();
  if (!sectionIds.includes(sectionId)) return;

  requestAnimationFrame(() => {
    scrollToSection(sectionId, undefined, 'auto');
  });
};
