<?php

namespace App\Controller\Admin;

use App\Entity\Exemplaire;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class ExemplaireCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Exemplaire::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        yield from parent::configureFields($pageName);
        yield AssociationField::new('livre');
        yield AssociationField::new('usure');
        yield AssociationField::new('stock');
    }
    
}
