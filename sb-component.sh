# NOTE: Replace with the correct path to your own microservices folder
alias nj_micro="~/NiceJob/microservices"
# NOTE: Replace with the correct path to your own src/design-system folder
alias nj_design_system="~/NiceJob/microservices/appengine-routes/frontend-route/src/design-system"

sb-component () {
  echo $1 | tr '[:upper:]' '[:lower:]' | read lowercase_input
  capitalized_input="$(tr '[:lower:]' '[:upper:]' <<< ${lowercase_input:0:1})${lowercase_input:1}"

  nj_design_system
  mkdir $lowercase_input
  touch $lowercase_input/$capitalized_input.tsx

  echo "import React, { ReactElement } from 'react';
import { Styled${capitalized_input} } from './${capitalized_input}.styles';

export interface ${capitalized_input}Props {}

export default function $capitalized_input(props: ${capitalized_input}Props): ReactElement {
    return <Styled${capitalized_input} {...props}>${capitalized_input} Component</Styled${capitalized_input}>;
}" >> $lowercase_input/$capitalized_input.tsx

  echo "import styled from 'styled-components';
import theme from '../../css/styled-components/theme';
import { ${capitalized_input}Props } from './$capitalized_input';

// Styled components
export const Styled${capitalized_input} = styled.div<${capitalized_input}Props>\`
    color: \${theme.colors.blue500};
\`;

// Helpers" >> $lowercase_input/$capitalized_input.styles.tsx

  echo "import React, { ReactElement } from 'react';
import ${capitalized_input} from './${capitalized_input}';
import styled from 'styled-components';
import { text, boolean } from '@storybook/addon-knobs';

export default {
    title: '${capitalized_input}',
    component: ${capitalized_input},
};

export function ${capitalized_input}List(): ReactElement {
    return <${capitalized_input} />;
}" >> $lowercase_input/$capitalized_input.stories.tsx

  echo "import { Meta, Story, Preview } from '@storybook/addon-docs/blocks';
import { ${capitalized_input} } from \"./${capitalized_input}\"

<Meta title=\"${capitalized_input} Component\" component={${capitalized_input}} />

# ${capitalized_input}
The \`<${capitalized_input} />\` component [brief description].

## ${capitalized_input} Props
Name      | Type      | Default   | Required | Description
----------|-----------|-----------|----------|-------------
first_prop | \`boolean\` | \`false\` |✅ | [Prop description goes here]

## Usage
Here are examples of the different \`<${capitalized_input} />\` component variants.
<Preview>
    <Story id=\"$lowercase_input--$lowercase_input-list\" />
</Preview>" >> $lowercase_input/$capitalized_input.stories.mdx

nj_micro
}
